cask "aider-vision" do
  version "0.90.13.dev2"
  sha256 "f2d7d4efe118f159f88aa1bf78b626101756828e02bb93eb5274f11165d06ba4"

  url "https://github.com/Digital-Defiance/aider-vision/releases/download/v#{version}/Aider.Vision_#{version}_universal.dmg"
  name "Aider Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Aider Vision Core AI coding assistant which is a headless version of Aider with some improvements."
  homepage "https://aider-vision.digitaldefiance.org"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Aider Vision.app"
end
