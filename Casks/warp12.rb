cask "warp12" do
  version "0.1.0"
  sha256 "7ffff07c9720b5ed9c319c9a37634345470f2bcb8103cea8b6f34e2ef3b9003f"

  url "https://github.com/Digital-Defiance/Warp12/releases/download/v#{version}/Warp%2012_#{version}_universal.dmg"
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
