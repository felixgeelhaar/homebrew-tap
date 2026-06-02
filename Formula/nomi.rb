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
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-arm64.tar.gz"
      sha256 "85940ef90a6a906cad53df6bf676ecf3eb380db1d3e72052973bb139195bf7c2"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-amd64.tar.gz"
      sha256 "9bf77fdc0c070ed538ede0f46c08ecad1bd0ede3409bb4d1308a44d2fa7a4f4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-arm64.tar.gz"
      sha256 "152afcd95a64bf6a900a2cc89ce6e01c0459df16f041317ed1f18e52fe111b82"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-amd64.tar.gz"
      sha256 "087ed1c19689d1b5ed815fcc88ad2b4ef68c9d6e0eb892b2010741005cc5168b"
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
