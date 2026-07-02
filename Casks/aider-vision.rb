cask "aider-vision" do
  version "0.90.12.dev2"
  sha256 "876f062f307c666b9d7f07c56a76944ea6ee6d741d1d1b8e0e7192978745f8b1"

  url "https://github.com/Digital-Defiance/aider-vision/releases/download/v#{version}/Aider.Vision_#{version}_universal.dmg"
  name "Aider Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Aider Vision Core AI coding assistant which is a headless version of Aider with some improvements."
  homepage "https://aider-vision.digitaldefiance.org"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Aider Vision.app"
end
