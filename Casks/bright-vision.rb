cask "bright-vision" do
  version "0.1.0-bright5"
  sha256 "227335b6c1263adafe9d0a11a4f778005e64bdfa8663d052d4240bf435c147fb"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/Bright.Vision_#{version}_universal.dmg"
  name "Bright Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Bright Vision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "Bright Vision.app"
end
