# Example Homebrew cask for digital-defiance/homebrew-tap.
# Copy to Casks/warp12.rb — cask token warp12; app/DMG use Warp 12.
cask "warp12" do
  version "0.5.0"
  sha256 "f0f28d8b0a1dce875fec7e69404dcb00e9c4e1b82265d6160c59a2f357de769d"

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
