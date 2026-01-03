# Homebrew formula for Temper
# To install: brew tap felixgeelhaar/tap && brew install temper
class Temper < Formula
  desc "Adaptive AI pairing tool for learning through deliberate practice"
  homepage "https://github.com/felixgeelhaar/temper"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-darwin-arm64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "temper-darwin-arm64" => "temper"
        bin.install "temperd-darwin-arm64" => "temperd"
      end
    else
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-darwin-amd64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "temper-darwin-amd64" => "temper"
        bin.install "temperd-darwin-amd64" => "temperd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-linux-arm64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "temper-linux-arm64" => "temper"
        bin.install "temperd-linux-arm64" => "temperd"
      end
    else
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-linux-amd64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "temper-linux-amd64" => "temper"
        bin.install "temperd-linux-amd64" => "temperd"
      end
    end
  end

  def caveats
    <<~EOS
      To get started with Temper:
        temper doctor        # Check system health
        temper start         # Start the daemon
        temper status        # Check daemon status

      Editor integrations:
        - VS Code: Install the Temper extension from marketplace
        - Neovim: Add felixgeelhaar/temper plugin

      Documentation: https://github.com/felixgeelhaar/temper#readme
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/temper --version")
  end
end
