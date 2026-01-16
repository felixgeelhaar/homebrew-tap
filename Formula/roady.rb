# typed: false
# frozen_string_literal: true

class Roady < Formula
  desc "A planning-first system of record for software work."
  homepage "https://felixgeelhaar.github.io/roady/"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/felixgeelhaar/roady/releases/download/v0.4.0/roady_Darwin_x86_64.tar.gz"
      sha256 "19c51ff4d918590921e1de3533d4a02c26876d492e847273beb3a57c74684134"

      def install
        bin.install "roady"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/roady/releases/download/v0.4.0/roady_Darwin_arm64.tar.gz"
      sha256 "c358a7b61e88f10efe6353ab11401821476e15f7201e736dca81fba85ac0fcbb"

      def install
        bin.install "roady"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/roady/releases/download/v0.4.0/roady_Linux_x86_64.tar.gz"
      sha256 "21e22cd8b799097ae316b24a79bd6422c6dc9e910ceab9044181f4f82225e629"
      def install
        bin.install "roady"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/felixgeelhaar/roady/releases/download/v0.4.0/roady_Linux_arm64.tar.gz"
      sha256 "15492fd05bf5fc50adefa8ceefecb265444fe11e8576744ca48f2e2a973e1a6b"
      def install
        bin.install "roady"
      end
    end
  end
end
