cask "brightvision" do
  version "0.1.2-bright15"
  sha256 "f1a9d71e6f5b52db69676bac77ca2ede6a411d027a7ddc2201bf088a0aa925c3"

  url "https://github.com/Digital-Defiance/BrightVision/releases/download/v#{version}/BrightVision_#{version}_universal.dmg"
  name "BrightVision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the BrightVision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://brightvision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "BrightVision.app"
end
