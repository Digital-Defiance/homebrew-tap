cask "brightvision" do
  version "0.2.1-bright5"
  sha256 "4ac0cc71cad166723a391d0e4250e0b4bce1df027cd32a7b4d1e019934273fb3"

  url "https://github.com/Digital-Defiance/BrightVision/releases/download/v#{version}/BrightVision_#{version}_universal.dmg"
  name "BrightVision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the BrightVision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://brightvision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "BrightVision.app"
end
