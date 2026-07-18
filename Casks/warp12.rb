# Example Homebrew cask for digital-defiance/homebrew-tap.
# Copy to Casks/warp12.rb — cask token warp12; app/DMG use Warp 12.
cask "warp12" do
  version "0.8.61"
  sha256 "dbe55c869c7a54e185b32e68f3310189ebcb31a5e18df869ca0494d311a3cac4"

  url "https://github.com/Digital-Defiance/Warp12/releases/download/v#{version}/Warp_12_#{version}_universal.dmg"
  name "Warp 12"
  desc "Federation-themed double-twelve Mexican Train dominoes (Tauri + React)"
  homepage "https://github.com/Digital-Defiance/Warp12"

  app "Warp 12.app"

  zap trash: [
    "~/Library/Application Support/org.digitaldefiance.app.warp12",
    "~/Library/Caches/org.digitaldefiance.app.warp12",
    "~/Library/Preferences/org.digitaldefiance.app.warp12.plist",
    "~/Library/Saved Application State/org.digitaldefiance.app.warp12.savedState",
  ]
end
