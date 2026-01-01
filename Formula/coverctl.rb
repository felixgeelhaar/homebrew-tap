# Homebrew formula for Coverctl
# To install: brew tap felixgeelhaar/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for Go teams"
  homepage "https://github.com/felixgeelhaar/coverctl"
  version "1.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "2f0d52cffa37d1c97554d9a14624edad23073745115df7cd126e19f6a29c640a"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "3a528d8c7526e4a3f963dab5482fca5374aa0a337403be15506c225c73139b4e"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "e4c604a8690d930d01483ef34aa286420249dcb542cc8362695f11dcbb4a0776"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "b62eeb3b50d3d7088479ee1025a8b93ffe097db0eecbee7b5ed18c0668e4417e"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
