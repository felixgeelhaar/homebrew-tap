# Homebrew formula for Coverctl
# To install: brew tap felixgeelhaar/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for Go teams"
  homepage "https://github.com/felixgeelhaar/coverctl"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "f46efa7e18aa0d1272ff0ae8504843de1b9ab8249f1c56a6db562c858c5f71f7"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "00e8c37f4d94e45b5796df60c6a0a62513d4768f6891b342b24b9d2eac75babd"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "27fec886d4fe76adbf2025799bd70bd783e77dba3f3d5cd4f8ccf3ac3dd4978b"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "41f12b79ea5acfdece538138ef4f645525cd35608c1c442a56d6a0d890b6922e"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
