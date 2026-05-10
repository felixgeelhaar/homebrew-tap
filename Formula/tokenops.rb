# typed: false
# frozen_string_literal: true

class Tokenops < Formula
  desc "Open-source operational intelligence layer for AI systems"
  homepage "https://github.com/felixgeelhaar/tokenops"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
