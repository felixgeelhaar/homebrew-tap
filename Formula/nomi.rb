# Homebrew formula for the `nomi` CLI client.
#
# Coexists with the `nomi` cask (Casks/nomi.rb) which installs the
# Tauri desktop bundle. Same naming convention as Docker:
#
#   brew install --cask felixgeelhaar/tap/nomi   # Nomi.app (UI + daemon)
#   brew install        felixgeelhaar/tap/nomi   # `nomi` CLI only
#
# The CLI talks to a running `nomid` over REST. It does NOT bundle the
# daemon — install the cask if you want the all-in-one desktop, or use
# Docker / `go install go.klarlabs.de/nomi/cmd/nomid` for a
# headless deploy.
#
# SHA256s are filled in by the release pipeline; the placeholders below
# get rewritten by `gh release upload` + a tap-bump step. Until that's
# wired, run `brew install --build-from-source felixgeelhaar/tap/nomi`
# (or use `go install go.klarlabs.de/nomi/cmd/nomi@latest`).
class Nomi < Formula
  desc "CLI client for the Nomi local-first agent platform"
  homepage "https://github.com/klarlabs-studio/nomi"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/klarlabs-studio/nomi/releases/download/v#{version}/nomi-#{version}-darwin-arm64.tar.gz"
      sha256 "901cac7d9e24ae7821158436db22d8e13f8b4b3f2272e78fa08548826afff1d4"
    end
    on_intel do
      url "https://github.com/klarlabs-studio/nomi/releases/download/v#{version}/nomi-#{version}-darwin-amd64.tar.gz"
      sha256 "25e3478f4dd15a833311587f225e6f86f759e6b1a7c1cb10d4d62033622085ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/klarlabs-studio/nomi/releases/download/v#{version}/nomi-#{version}-linux-arm64.tar.gz"
      sha256 "f8facd76c4160bd9621764a7e17ac22d29a9938feb323e480d09c6462b0694de"
    end
    on_intel do
      url "https://github.com/klarlabs-studio/nomi/releases/download/v#{version}/nomi-#{version}-linux-amd64.tar.gz"
      sha256 "5553f3783dd743050845d6c5055705b15af5495916005481a1ff046c97e348c9"
    end
  end

  # Build-from-source fallback: kicks in for `brew install
  # --build-from-source` and any platform/arch combo without a
  # pre-built bottle. Lets early adopters install before the release
  # pipeline has populated SHA256s.
  head do
    url "https://github.com/klarlabs-studio/nomi.git", branch: "main"
    depends_on "go" => :build
  end

  def install
    if build.head?
      ldflags = %W[
        -s -w
        -X go.klarlabs.de/nomi/internal/buildinfo.Version=#{version}
        -X go.klarlabs.de/nomi/internal/buildinfo.Commit=brew-head
        -X go.klarlabs.de/nomi/internal/buildinfo.BuildDate=#{Time.now.utc.iso8601}
      ]
      system "go", "build", "-trimpath", "-ldflags", ldflags.join(" "),
             "-o", bin/"nomi", "./cmd/nomi"
    else
      bin.install "nomi"
    end
  end

  test do
    assert_match "nomi cli", shell_output("#{bin}/nomi version")
  end
end
