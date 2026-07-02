cask "bright-vision" do
  version "0.1.0-bright7"
  sha256 "f58d35e036ecb4b58a873d0b4048a278e1274c2edf38c86aaa3beeca60f7d132"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/Bright.Vision_#{version}_universal.dmg"
  name "Bright Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Bright Vision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "Bright Vision.app"
end
