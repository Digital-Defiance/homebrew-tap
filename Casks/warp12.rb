cask "warp12" do
  version "0.4.8"
  sha256 "05735fa8540412cb793ed04e2aaed27ff33a7b0878c4129d52995657983e820f"

  url "https://github.com/Digital-Defiance/Warp12/releases/download/v#{version}/Warp_12_#{version}_universal.dmg"
  name "Warp 12"
  desc "Star Trek-themed double-twelve Mexican Train dominoes (Tauri + React)"
  homepage "https://github.com/Digital-Defiance/Warp12"

  app "Warp 12.app"

  zap trash: [
    "~/Library/Application Support/org.digitaldefiance.app.warp12",
    "~/Library/Caches/org.digitaldefiance.app.warp12",
    "~/Library/Preferences/org.digitaldefiance.app.warp12.plist",
    "~/Library/Saved Application State/org.digitaldefiance.app.warp12.savedState",
  ]
end
