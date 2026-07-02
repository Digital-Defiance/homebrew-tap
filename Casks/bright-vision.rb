cask "bright-vision" do
  version "0.1.0-bright4"
  sha256 "63339321d8b4bc7f240be0b867a3f858c5346adf9f8c74efd5aac7c63adacd37"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/Bright.Vision_#{version}_universal.dmg"
  name "Bright Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Bright Vision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "Bright Vision.app"
end
