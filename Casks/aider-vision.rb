cask "aider-vision" do
  version "0.90.13.dev0"
  sha256 "304db23e8872c77c8b810a8008fca07a295600dbb82058c693cc92d44e41eac9"

  url "https://github.com/Digital-Defiance/aider-vision/releases/download/v#{version}/Aider.Vision_#{version}_universal.dmg"
  name "Aider Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Aider Vision Core AI coding assistant which is a headless version of Aider with some improvements."
  homepage "https://aider-vision.digitaldefiance.org"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Aider Vision.app"
end
