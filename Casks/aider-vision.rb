cask "aider-vision" do
  version "0.90.12.dev1"
  sha256 "62bc465e9e71e5c90383751d53d114d1941f5df10bb8298faf01332749449253"

  url "https://github.com/Digital-Defiance/aider-vision/releases/download/v#{version}/Aider.Vision_#{version}_universal.dmg"
  name "Aider Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Aider Vision Core AI coding assistant which is a headless version of Aider with some improvements."
  homepage "https://aider-vision.digitaldefiance.org"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Aider Vision.app"
end
