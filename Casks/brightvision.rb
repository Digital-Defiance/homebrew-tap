cask "brightvision" do
  version "0.2.2-bright2"
  sha256 "9bbfdf3e4d27872573b25edb7dd1344194dea841404f6f785f7d2040d17f21a4"

  url "https://github.com/Digital-Defiance/BrightVision/releases/download/v#{version}/BrightVision_#{version}_universal.dmg"
  name "BrightVision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the BrightVision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://brightvision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "BrightVision.app"
end
