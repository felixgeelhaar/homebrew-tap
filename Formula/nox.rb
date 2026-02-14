# Homebrew formula for Nox
# To install: brew tap felixgeelhaar/tap && brew install nox
class Nox < Formula
  desc "Language-agnostic security scanner with first-class AI application security"
  homepage "https://github.com/nox-hq/nox"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nox-hq/nox/releases/download/v#{version}/nox_#{version}_darwin_arm64.tar.gz"
      sha256 "bc6efb202499f7ffe633fc472b5a0ab533e6a32e5a85307a8383b63c637c8c87"

      def install
        bin.install "nox"
      end
    else
      url "https://github.com/nox-hq/nox/releases/download/v#{version}/nox_#{version}_darwin_amd64.tar.gz"
      sha256 "8c0bf4530c9904e861dfb624e5562f2569f6d46236c25e6841d44c0193aef96f"

      def install
        bin.install "nox"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nox-hq/nox/releases/download/v#{version}/nox_#{version}_linux_arm64.tar.gz"
      sha256 "b14227886e1231e3c3fc10db2a85a8559c7276f2c2a9388bedb90cdef2965e38"

      def install
        bin.install "nox"
      end
    else
      url "https://github.com/nox-hq/nox/releases/download/v#{version}/nox_#{version}_linux_amd64.tar.gz"
      sha256 "e2c26e641d7c32304866e6840154aa9a4e61517d97270eb5895d566634bac180"

      def install
        bin.install "nox"
      end
    end
  end

  test do
    system "#{bin}/nox", "--help"
  end
end
