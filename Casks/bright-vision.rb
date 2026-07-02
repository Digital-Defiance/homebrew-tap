cask "bright-vision" do
  version "0.1.0-bright2"
  sha256 "9dbb9ec77070172051089fbd2dda02a5d6b682885153d111696d082038741041"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/Bright.Vision_#{version}_universal.dmg"
  name "Bright Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Bright Vision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "Bright Vision.app"
end
