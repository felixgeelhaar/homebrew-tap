# Homebrew formula for Coverctl
# To install: brew tap felixgeelhaar/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for Go teams"
  homepage "https://github.com/felixgeelhaar/coverctl"
  version "1.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "9c7d098cb09129a453edb0fb010b3e8f36ef4f700d7b92381ed8820329502071"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "5ea77deb552c93724d07e7d7130bb38d4eb96b5b905aebfd108aefd1319947ee"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "f19e3d6fbc713ca6c40d33201df9475819ebba8a692af52432ff24f5f1e15333"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "a79208ef4a3f75ba896157222d624907feebdd8218c4b06674b03a6587da6b92"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
