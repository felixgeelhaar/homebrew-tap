class Resonance < Formula
  desc "Terminal-native live coding music instrument"
  homepage "https://github.com/felixgeelhaar/resonance"
  license "MIT"
  version "0.1.1"

  on_macos do
    url "https://github.com/felixgeelhaar/resonance/releases/download/v0.1.1/resonance-macos-arm64.tar.gz"
    sha256 "dd90392b9a4cccc2e27b9a5dc41cc397afeca1f1537512e2d145c0249b346806"
  end

  on_linux do
    url "https://github.com/felixgeelhaar/resonance/releases/download/v0.1.1/resonance-linux-amd64.tar.gz"
    sha256 "e31eb814e702a849a844d6f072951406f467bc64a3b8ac3281d74961d3a78eba"
  end

  def install
    bin.install "resonance"
  end

  test do
    assert_match "resonance", shell_output("#{bin}/resonance --version")
  end
end
