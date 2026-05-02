cask "nomi" do
  version "0.1.2"
  sha256 "4b1b23de62fe8d3811bc73566ae065f8d0418fe30fe8e6cc6b5aa7957fbdf894"

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
