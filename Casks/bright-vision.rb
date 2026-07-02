cask "bright-vision" do
  version "0.1.1-bright1"
  sha256 "84bd22eaf42cf0d544a2c79cca0de1fc56d93c55b46dd2e7e25604c3fee2ddee"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/BrightVision_#{version}_universal.dmg"
  name "BrightVision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the BrightVision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "BrightVision.app"
end
