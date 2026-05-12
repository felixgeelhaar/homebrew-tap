# typed: false
# frozen_string_literal: true

class Tokenops < Formula
  desc "Open-source operational intelligence layer for AI systems"
  homepage "https://github.com/felixgeelhaar/tokenops"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.2.0/tokenops_0.2.0_darwin_amd64.tar.gz"
      sha256 "6da3e1b1825f05a6ab6c966fe801058bda7c31d59d1da9db1ea3bd3c48fd953d"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.2.0/tokenops_0.2.0_darwin_arm64.tar.gz"
      sha256 "4c7ff0e36f1e393d8d2dc89528e195c684d6cf5d2c38a89302583a4b661dafbf"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.2.0/tokenops_0.2.0_linux_amd64.tar.gz"
      sha256 "43e8aab5b20cf2a19a157542e44f92e4c3b72b7fbfaf0a51d616d03cc01ea11f"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.2.0/tokenops_0.2.0_linux_arm64.tar.gz"
      sha256 "42ca12ea85404baeaf7c12138b97f2d4691a16f05a4860c064c7b87731f39f90"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
  end

  test do
    system "#{bin}/tokenops", "version"
    system "#{bin}/tokenopsd", "version"
  end
end
