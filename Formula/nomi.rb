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
# Docker / `go install github.com/felixgeelhaar/nomi/cmd/nomid` for a
# headless deploy.
#
# SHA256s are filled in by the release pipeline; the placeholders below
# get rewritten by `gh release upload` + a tap-bump step. Until that's
# wired, run `brew install --build-from-source felixgeelhaar/tap/nomi`
# (or use `go install github.com/felixgeelhaar/nomi/cmd/nomi@latest`).
class Nomi < Formula
  desc "CLI client for the Nomi local-first agent platform"
  homepage "https://github.com/felixgeelhaar/nomi"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-arm64.tar.gz"
      sha256 "0867e277e5dca6cae16af2c423a60e393059e10b50a7dbb815014d88f290ab21"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-amd64.tar.gz"
      sha256 "563f4e3daff0229b85775421bb39227eaeb4455946c026678df7e39c79c20e24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-arm64.tar.gz"
      sha256 "236f5c6e6c132fe2d4ef0a6968bc891139b57a0837916629656c5aa768b766f1"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-amd64.tar.gz"
      sha256 "3934426a00209fe11cd53eb4efc02f19b892436e7d75c692fc40235d726a3362"
    end
  end

  # Build-from-source fallback: kicks in for `brew install
  # --build-from-source` and any platform/arch combo without a
  # pre-built bottle. Lets early adopters install before the release
  # pipeline has populated SHA256s.
  head do
    url "https://github.com/felixgeelhaar/nomi.git", branch: "main"
    depends_on "go" => :build
  end

  def install
    if build.head?
      ldflags = %W[
        -s -w
        -X github.com/felixgeelhaar/nomi/internal/buildinfo.Version=#{version}
        -X github.com/felixgeelhaar/nomi/internal/buildinfo.Commit=brew-head
        -X github.com/felixgeelhaar/nomi/internal/buildinfo.BuildDate=#{Time.now.utc.iso8601}
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
