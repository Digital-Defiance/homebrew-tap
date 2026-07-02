cask "brightvision" do
  version "0.2.2-bright7"
  sha256 "5b0faf3a2f64d94fd7dc8c4bece9e94170adfe43661188f3d64896106d13e3c5"

  url "https://github.com/Digital-Defiance/BrightVision/releases/download/v#{version}/BrightVision_#{version}_universal.dmg"
  name "BrightVision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the BrightVision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://brightvision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "BrightVision.app"
end
