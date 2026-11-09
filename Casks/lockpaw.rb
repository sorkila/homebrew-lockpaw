cask "lockpaw" do
  version "1.7.2"
  sha256 "53dadab7b3eee4fa30f63733675552c708be45ab29d5339d1b5073663bd5fd5a"

  url "https://github.com/sorkila/lockpaw/releases/download/v#{version}/Lockpaw.dmg"
  name "Lockpaw"
  desc "Cover the screen while AI agents keep running"
  homepage "https://getlockpaw.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Lockpaw.app"

  uninstall launchctl: "com.eriknielsen.lockpaw.helper",
            quit:      "com.eriknielsen.lockpaw"

  zap trash: [
    "~/Library/Caches/com.eriknielsen.lockpaw",
    "~/Library/HTTPStorages/com.eriknielsen.lockpaw",
    "~/Library/Preferences/com.eriknielsen.lockpaw.plist",
  ]
end
