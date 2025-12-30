# Homebrew formula for Preflight
# To install: brew tap felixgeelhaar/tap && brew install preflight
class Preflight < Formula
  desc "Deterministic workstation compiler"
  homepage "https://github.com/felixgeelhaar/preflight"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-arm64.tar.gz"
      sha256 "718bde818b3656b4bc49ad1e945354ef65b06ca1d00d647139b7c879ee8fa755"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-darwin-amd64.tar.gz"
      sha256 "c5e010c988fb7b2499f68afb490ff316030d3b8e34ef15fc0bf0d445180d75ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-arm64.tar.gz"
      sha256 "83c74e5b88e213c4d5b54863fb2b01c982d4be21be251521ac17907757fa86d5"
    else
      url "https://github.com/felixgeelhaar/preflight/releases/download/v#{version}/preflight-linux-amd64.tar.gz"
      sha256 "71124eb0bdcc646917ae68c36a88d87891902a3a208145d17e7a44dfb646f970"
    end
  end

  def install
    bin.install "preflight"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/preflight version")
  end
end
