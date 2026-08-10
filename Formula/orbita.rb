# Homebrew formula for Orbita
# To install: brew tap felixgeelhaar/tap && brew install orbita
class Orbita < Formula
  desc "CLI-first adaptive productivity operating system - orchestrates tasks, calendars, habits, and meetings"
  homepage "https://github.com/felixgeelhaar/orbita"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-darwin-arm64.tar.gz"
      sha256 "505e5dbb81c13fc4b0db8fcfdeaa3898c9619a84a3e91eabf1477019ecc20705"

      def install
        bin.install "orbita-darwin-arm64" => "orbita"
      end
    else
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-darwin-amd64.tar.gz"
      sha256 "0808fd00246d4cbfd474494f35cfe1ec1bde320e4c653601037c1de048563d22"

      def install
        bin.install "orbita-darwin-amd64" => "orbita"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-linux-arm64.tar.gz"
      sha256 "f67613731fd1619759df68f763eed5fac89b1f64d70f1fe6501af6b8f667891d"

      def install
        bin.install "orbita-linux-arm64" => "orbita"
      end
    else
      url "https://github.com/felixgeelhaar/orbita/releases/download/v#{version}/orbita-linux-amd64.tar.gz"
      sha256 "b55077cab0edc65c5a5ae8c1ad57ae03255bb9c9a3bf3ac3657f46c039a07048"

      def install
        bin.install "orbita-linux-amd64" => "orbita"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/orbita version")
  end
end
