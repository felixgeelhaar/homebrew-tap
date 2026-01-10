# Homebrew formula for Orbita
# To install: brew tap felixgeelhaar/tap && brew install orbita
class Orbita < Formula
  desc "CLI-first adaptive productivity operating system - orchestrates tasks, calendars, habits, and meetings"
  homepage "https://github.com/felixgeelhaar/orbita"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-darwin-arm64.tar.gz"
      sha256 "f9ba1c5348195fb694b83c451da278e836d3419b12ffd8cc79478e9e201d596a"

      def install
        bin.install "orbita-darwin-arm64" => "orbita"
      end
    else
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-darwin-amd64.tar.gz"
      sha256 "d65b3a4e680f231ec14e7530625c9ac868e5f0d973cd4d0862d416de7f336f46"

      def install
        bin.install "orbita-darwin-amd64" => "orbita"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-linux-arm64.tar.gz"
      sha256 "86502613578826f8b6d96b7ec29587aca8c3ab84b0b35407bec600a3c5c4cb1e"

      def install
        bin.install "orbita-linux-arm64" => "orbita"
      end
    else
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-linux-amd64.tar.gz"
      sha256 "a7a8886db13cb5da390a53b437f18f63f5170bd7bd49b8674471e60081e3d934"

      def install
        bin.install "orbita-linux-amd64" => "orbita"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orbita version")
  end
end
