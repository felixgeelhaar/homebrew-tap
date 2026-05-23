cask "nomi" do
  version "0.2.1"
  sha256 "9778b6d2ba4a556f0cb59a3063ca764f5f595a40bdf4f032aa80bdc06af9d3d2"

  url "https://github.com/felixgeelhaar/nomi/releases/download/v#{version}/Nomi_#{version}_universal.dmg"
  name "Nomi"
  desc "Local-first, state-driven agent platform"
  homepage "https://nomi.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Nomi.app"

  zap trash: [
    "~/Library/Application Support/Nomi",
    "~/Library/Caches/ai.nomi.app",
    "~/Library/Preferences/ai.nomi.app.plist",
    "~/Library/Saved Application State/ai.nomi.app.savedState",
  ]
end
