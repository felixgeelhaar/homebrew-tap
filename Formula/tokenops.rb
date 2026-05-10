# typed: false
# frozen_string_literal: true

class Tokenops < Formula
  desc "Open-source operational intelligence layer for AI systems"
  homepage "https://github.com/felixgeelhaar/tokenops"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_darwin_amd64.tar.gz"
      sha256 "d4ada77a8db42755fedf79b9924209130f9aa3da8e9b616c192a8038493bf643"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_darwin_arm64.tar.gz"
      sha256 "9817860979c9d9abdbe8a32e28d1e04dd71b8ae481aa75d599da6954e6eb2759"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_linux_amd64.tar.gz"
      sha256 "e8a8fbc76fac641308418dfd104b5fb7aa2faf25c7cf90d6d477490a45f8dd46"

      def install
        bin.install "tokenops"
        bin.install "tokenopsd"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/tokenops/releases/download/v0.1.0/tokenops_0.1.0_linux_arm64.tar.gz"
      sha256 "abbf1780edc670e9f9bc0478b558fd117b707548b2450bf0cbe56c229eb9fb7f"

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
