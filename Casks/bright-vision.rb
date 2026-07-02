cask "bright-vision" do
  version "0.1.0-bright0"
  sha256 "6d37553b49b1092dab5ebc559cd31badd8fb39cfe57642ac1b01f86dbaaf33e5"

  url "https://github.com/Digital-Defiance/bright-vision/releases/download/v#{version}/Bright.Vision_#{version}_universal.dmg"
  name "Bright Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Bright Vision Core AI coding assistant which is a headless version of Cecli with some improvements."
  homepage "https://bright-vision.digitaldefiance.org"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Bright Vision.app"
end
