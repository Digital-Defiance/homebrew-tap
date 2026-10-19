cask "copyist" do
  version "0.0.1"
  sha256 "28046ccf2c4eeedb799eb8ee8a3abc3afb1be78317b5e1b1978bf142d4467862"

  url "https://github.com/Digital-Defiance/copyist/releases/download/v#{version}/Copyist_#{version}_aarch64.dmg"
  name "Copyist"
  desc "Score-first songwriting: the song, the score, the sound"
  homepage "https://copyist.digitaldefiance.org/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Copyist.app"

  # Songs in ~/Music/Copyist are the person's own work, so zap leaves them.
  zap trash: [
    "~/Library/Application Support/Copyist",
    "~/Library/Application Support/org.digitaldefiance.copyist",
    "~/Library/Caches/org.digitaldefiance.copyist",
    "~/Library/Preferences/org.digitaldefiance.copyist.plist",
    "~/Library/WebKit/org.digitaldefiance.copyist",
  ]
end
