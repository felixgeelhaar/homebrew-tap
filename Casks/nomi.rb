cask "nomi" do
  version "0.4.0"
  sha256 "18d29ce5fce877218a66d53d91498dbf8515e760dc8a1bbdee6258f960ad4867"

  url "https://github.com/klarlabs-studio/nomi/releases/download/v#{version}/Nomi_#{version}_universal.dmg"
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
