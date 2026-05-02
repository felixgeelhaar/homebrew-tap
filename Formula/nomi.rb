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
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-arm64.tar.gz"
      sha256 "ca4dd00b6dc165a540e81e4f50d8dc24a8f715e0f553e1eec8a6029e5fc09fb4"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-amd64.tar.gz"
      sha256 "ba96cae2daa06c210284af9715a160e207c111087e06baf6da966d21ca4dd0b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-arm64.tar.gz"
      sha256 "f648e18a56f3dc62a23ddf0994e58f9d0f8376bf63c60ca56e2dc520a21ec1c1"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-amd64.tar.gz"
      sha256 "23a6e70477cc569554ae3fb6a23dcea8ac53afd7127bca4483b84e760ad7f156"
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
