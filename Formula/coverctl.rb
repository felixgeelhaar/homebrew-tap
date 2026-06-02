# Homebrew formula for Coverctl
# To install: brew tap felixgeelhaar/tap && brew install coverctl
class Coverctl < Formula
  desc "Declarative, domain-aware coverage enforcement for any language"
  homepage "https://github.com/felixgeelhaar/coverctl"
  version "1.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-arm64.tar.gz"
      sha256 "040dfdc7a6c2b6875baac8486e858ef325c57a59329aa76016b52a7a887bb8d8"

      def install
        bin.install "coverctl-darwin-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-darwin-amd64.tar.gz"
      sha256 "21606adf9818559efd7a2330b6b7892c1199bfe7a5dff5dc6cf9e92d26ea1f5b"

      def install
        bin.install "coverctl-darwin-amd64" => "coverctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-arm64.tar.gz"
      sha256 "ed14519cfb883d71abcfea13de8256f2d88682ca020ba5a40d054129511a6b54"

      def install
        bin.install "coverctl-linux-arm64" => "coverctl"
      end
    else
      url "https://github.com/felixgeelhaar/coverctl/releases/download/v#{version}/coverctl-linux-amd64.tar.gz"
      sha256 "0e3c42834959ab48048512de1000dd17f4476d1d9385342c83ba3bc29868e5c1"

      def install
        bin.install "coverctl-linux-amd64" => "coverctl"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coverctl --version")
  end
end
