# Homebrew formula for Preflight
# To install: brew tap felixgeelhaar/tap && brew install preflight
class Preflight < Formula
  desc "Deterministic workstation compiler"
  homepage "https://github.com/felixgeelhaar/preflight"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-arm64.tar.gz"
      sha256 "bf08082aec81bb2c170997f90b83f1e93ebc731b554bdf46cbc678dae5c1ece4"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-amd64.tar.gz"
      sha256 "7c717bdd91f02eb22acc8cb441ea566f3bed8ef94bd6947c25955e11e9969a33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-arm64.tar.gz"
      sha256 "456e5f25f2e12fe0d4c2a7fdff344fd7ad7305c0374bcfbc14176e8f552a02d9"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-amd64.tar.gz"
      sha256 "610d803bc6c3cb30739f20d46c7e828d785ecf9cc99b4f92e101ad78e52a5a1e"
    end
  end

  def install
    bin.install "preflight"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/preflight version")
  end
end
