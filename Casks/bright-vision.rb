cask "bright-vision" do
  version "0.1.0-bright6"
  sha256 "6d636cb6e22d9aa123d89347309238309962a4e79d869a6a6ca98b0ac84dad2c"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/Bright.Vision_#{version}_universal.dmg"
  name "Bright Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Bright Vision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe

  app "Bright Vision.app"
end
