# typed: false
# frozen_string_literal: true

class Verdictsec < Formula
  desc "Comprehensive security assessment CLI tool for Go projects"
  homepage "https://github.com/felixgeelhaar/verdictsec"
  url "https://github.com/felixgeelhaar/verdictsec/archive/refs/tags/v0.13.2.tar.gz"
  sha256 "38ed1ab1e024eeeb5aa715c08c1db3748d8fca7ba8ae61b7ac0c25f25abea799"
  license "Apache-2.0"
  head "https://github.com/felixgeelhaar/verdictsec.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=v#{version}
      -X main.buildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:, output: bin/"verdict"), "./cmd/verdict"
  end

  def caveats
    <<~EOS
      VerdictSec requires the following tools for full functionality:

        brew install gosec
        go install golang.org/x/vuln/cmd/govulncheck@latest
        go install github.com/gitleaks/gitleaks/v8@latest
        go install github.com/CycloneDX/cyclonedx-gomod/cmd/cyclonedx-gomod@latest

      To configure MCP server for Claude Desktop, add to claude_desktop_config.json:
        {
          "mcpServers": {
            "verdictsec": {
              "command": "#{opt_bin}/verdict",
              "args": ["mcp", "serve"]
            }
          }
        }
    EOS
  end

  test do
    assert_match "VerdictSec", shell_output("#{bin}/verdict --help")
    assert_match "mcp", shell_output("#{bin}/verdict mcp --help")
  end
end
