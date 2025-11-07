# Homebrew Tap for Specular

Official Homebrew tap for [Specular](https://github.com/felixgeelhaar/specular) - AI-native development framework with specification-driven workflows.

## Installation

```bash
# Add the tap
brew tap felixgeelhaar/tap

# Install specular
brew install specular
```

## Available Formulas

- **specular** - AI-native development framework with spec-first, policy-enforced software development

## Usage

After installation, you can use Specular directly:

```bash
# Check version
specular version

# See all commands
specular --help

# Start an interactive interview
specular interview --preset api-service --list

# Generate spec from PRD
specular spec generate --in PRD.md --out .specular/spec.yaml
```

## Updates

The formula is automatically updated when new releases are published via GoReleaser.

```bash
# Update tap
brew update

# Upgrade specular
brew upgrade specular
```

## Support

- [Documentation](https://github.com/felixgeelhaar/specular/blob/main/README.md)
- [Issues](https://github.com/felixgeelhaar/specular/issues)
- [Releases](https://github.com/felixgeelhaar/specular/releases)
