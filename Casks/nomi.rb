cask "nomi" do
  version "0.1.4"
  sha256 "21ef09c3a61dce3ce4e074e161023df7b12a4abce42b3ae202826e7d46196725"

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
