# Homebrew formula for Coverctl
# To install: brew tap felixgeelhaar/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for any language"
  homepage "https://github.com/klarlabs-studio/coverctl"
  version "1.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "74dcdca8f9c9809ab41cc83174cc38305f0387b8b1b66e9fa097b0a4c9074b1c"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "95ad49b19ce824770de7772db3493dcb71ba90653e4a7a44858529a72634bf85"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "ab76ada31275a3dff947107ff398f1bed9b74f0612c0da01b4badc8db16af4f5"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/klarlabs-studio/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "b82917fab8deba2a3436fc4bdc700646812fcf88cf80de1ef1da0249d47c620b"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
