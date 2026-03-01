# Homebrew formula for Coverctl
# To install: brew tap felixgeelhaar/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for Go teams"
  homepage "https://github.com/felixgeelhaar/coverctl"
  version "1.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "a62225238fe90e6b61d902ce74ddf340a3cee993843466069e0d21d5932cf575"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "47fc4ffb0133c3df3233a394d35a9d7cadb5b450777b243c4ab9c6419397a272"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "efec7d9ccee478b304dc0640578f31973bec66d7929e6991e343cd985f3ddfbf"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "c5e8720fe3426d4103aa93e76422c2bef5820a1b6d6de90b43c33802394a728a"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
