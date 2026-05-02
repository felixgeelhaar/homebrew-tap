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
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-arm64.tar.gz"
      sha256 "66472425325dddedef0df5c3dfc2a565214e3a4a590cd3a6bda0be7efaf063d9"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-amd64.tar.gz"
      sha256 "e1802a8a1fbf2402a5d342d47a0abe8383feb99f3012c0968a3a3d05774b0f04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-arm64.tar.gz"
      sha256 "957363449059372afc5b58ccd44c8873935dc6c308007f0e84aeecb374cbc36b"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-amd64.tar.gz"
      sha256 "00038bd5365f9ff43c9c00a8a47f6272f364b6f4933c9871fc3f58931f8a5299"
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
