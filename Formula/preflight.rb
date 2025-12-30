# Homebrew formula for Preflight
# To install: brew tap felixgeelhaar/tap && brew install preflight
class Preflight < Formula
  desc "Deterministic workstation compiler"
  homepage "https://github.com/felixgeelhaar/preflight"
  version "4.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-arm64.tar.gz"
      sha256 "a553524eaf6835f59531212e4a7839a5b7fa5320e42938aff36d06a74752b025"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-amd64.tar.gz"
      sha256 "7766b46bd489099c5db57d0ace8f38c94213418334cb813bf743e58efee60f10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-arm64.tar.gz"
      sha256 "74d4a7b8e7443f6713f8323fde9bcb4ff0e8d04fac316fe1efc1b35da9b65c52"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-amd64.tar.gz"
      sha256 "a2dc9f0670c18356cdad42ea02c1a7c5070e32d46a48d39d13d2aa273a10c267"
    end
  end

  def install
    bin.install "preflight"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/preflight version")
  end
end
