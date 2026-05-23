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
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-arm64.tar.gz"
      sha256 "ad06d712e33a4ad47067c1ca156e0800571472d90cfb5025f832d5515974166c"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-darwin-amd64.tar.gz"
      sha256 "6ff4353b280c7964b7e954511d62d4deb9580ea497ea0fd437d4061717f59cc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-arm64.tar.gz"
      sha256 "db29970cbf32f4aa2339878eb756ce2c3e9b517be52641d238f33cc4e3796adb"
    end
    on_intel do
      url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/nomi-#{version}-linux-amd64.tar.gz"
      sha256 "ff1b53072b3136b40e89c11eb066cde3c68977cdc361b670767e7f3f5e4f1282"
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
