cask "brightvision" do
  version "0.1.2-bright16"
  sha256 "e1f87c96fe508977fbd17f7da8547af25c6b61e0a3dcbf220f0eaaa3dd54254c"

  url "https://github.com/Digital-Defiance/BrightVision/releases/download/v#{version}/BrightVision_#{version}_universal.dmg"
  name "BrightVision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the BrightVision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://brightvision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "BrightVision.app"
end
