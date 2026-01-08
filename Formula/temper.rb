# Homebrew formula for Temper
# To install: brew tap felixgeelhaar/tap && brew install temper
class Temper < Formula
  desc "Adaptive AI pairing tool for learning through deliberate practice"
  homepage "https://github.com/felixgeelhaar/temper"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-darwin-arm64.tar.gz"
      sha256 "06bee20fb6519cb08f16d0c5b269d409600a5c54018514a3a355b4b46955d307"

      def install
        bin.install "temper-darwin-arm64" => "temper"
        bin.install "temperd-darwin-arm64" => "temperd"
      end
    else
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-darwin-amd64.tar.gz"
      sha256 "eaedc348d37603c29bce30bd0874a9dcafcdd9c49c88489738da4bbc42f6de7f"

      def install
        bin.install "temper-darwin-amd64" => "temper"
        bin.install "temperd-darwin-amd64" => "temperd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-linux-arm64.tar.gz"
      sha256 "d8067193a595f24082ef0b071c5d6bbeea58be81fece7b03a694f69eaa3b9f96"

      def install
        bin.install "temper-linux-arm64" => "temper"
        bin.install "temperd-linux-arm64" => "temperd"
      end
    else
      url "https://github.com/felixgeelhaar/temper/releases/download/v#{version}/temper-linux-amd64.tar.gz"
      sha256 "de31351c5ac4478cd967d26844b1af226089aa67cc0c2f8adda56a5894f545d7"

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
