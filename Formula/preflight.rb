# Homebrew formula for Preflight
# To install: brew tap felixgeelhaar/tap && brew install preflight
class Preflight < Formula
  desc "Deterministic workstation compiler"
  homepage "https://github.com/felixgeelhaar/preflight"
  version "4.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-arm64.tar.gz"
      sha256 "21b6adb4f38ce6df6cc5ef155ea964a12eb3f1b56eca2eee1baac56c61b9d512"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-amd64.tar.gz"
      sha256 "77766f5b2d714c7eaa12e02ed1a6b6a4426635794026a46b329b1d45d19c6ac3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-arm64.tar.gz"
      sha256 "b68896ecc8a0018d34690296599945c9bb1b2db1d502658b6706fde5f1e51fc4"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-amd64.tar.gz"
      sha256 "26fc55e847b131297c84f0e48f3e8092acffeccfcc4a7992b7ad047c13b7222d"
    end
  end

  def install
    bin.install "preflight"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/preflight version")
  end
end
