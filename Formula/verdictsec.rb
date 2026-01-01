# typed: false
# frozen_string_literal: true

class Verdictsec < Formula
  desc "Comprehensive security assessment CLI tool for Go projects"
  homepage "https://github.com/felixgeelhaar/verdictsec"
  url "https://github.com/felixgeelhaar/verdictsec/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "dc7be355026984aca443f5e61b5135cfddf705916b33840d8b1f2f123805762d"
  license "Apache-2.0"
  head "https://github.com/felixgeelhaar/verdictsec.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "-o", bin/"verdict", "./cmd/verdict"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "-o", bin/"verdict-mcp", "./cmd/verdict-mcp"
  end

  def caveats
    <<~EOS
      VerdictSec requires the following tools to be installed for full functionality:

        brew install gosec
        go install golang.org/x/vuln/cmd/govulncheck@latest
        go install github.com/gitleaks/gitleaks/v8@latest
        go install github.com/CycloneDX/cyclonedx-gomod/cmd/cyclonedx-gomod@latest

      To configure MCP server for Claude Desktop, add to claude_desktop_config.json:
        {
          "mcpServers": {
            "verdictsec": {
              "command": "#{opt_bin}/verdict-mcp",
              "args": []
            }
          }
        }
    EOS
  end

  test do
    assert_match "verdict", shell_output("#{bin}/verdict --help")
    assert_match "verdict-mcp", shell_output("#{bin}/verdict-mcp --help 2>&1", 1)
  end
end
