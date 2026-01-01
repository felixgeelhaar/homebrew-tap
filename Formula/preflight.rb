# Homebrew formula for Preflight
# To install: brew tap felixgeelhaar/tap && brew install preflight
class Preflight < Formula
  desc "Deterministic workstation compiler"
  homepage "https://github.com/felixgeelhaar/preflight"
  version "4.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-arm64.tar.gz"
      sha256 "396e079a65059d652958ef7bf39d2ebf6489d6c2ef87b207d3d4982b3dbbdbd9"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-amd64.tar.gz"
      sha256 "fbe3a88d3f6f40a63b8c7ec19baf208be4c5713b79e356d3e7db7c01410a0af4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-arm64.tar.gz"
      sha256 "fb7263908cd704962178d823ea149cfc763d306573099146c94e59b9c0a62b60"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-amd64.tar.gz"
      sha256 "1cab77e61c32a42bb5396e9a90507107889c8109d575e79a36d49698235c01d7"
    end
  end

  def install
    bin.install "preflight"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/preflight version")
  end
end
