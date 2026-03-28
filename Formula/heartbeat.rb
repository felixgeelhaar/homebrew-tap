class Heartbeat < Formula
  desc "MCP server for running team health checks with AI agents"
  homepage "https://github.com/felixgeelhaar/heartbeat"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/heartbeat/releases/download/v1.0.0/heartbeat_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    if Hardware::CPU.intel?
      url "https://github.com/felixgeelhaar/heartbeat/releases/download/v1.0.0/heartbeat_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/heartbeat/releases/download/v1.0.0/heartbeat_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    if Hardware::CPU.intel?
      url "https://github.com/felixgeelhaar/heartbeat/releases/download/v1.0.0/heartbeat_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "heartbeat"
  end

  test do
    system "#{bin}/heartbeat", "--help"
  end
end
