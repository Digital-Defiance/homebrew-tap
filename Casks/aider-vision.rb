cask "AiderVision" do
  version "1.1.1"
  sha256 "sha256:7e0593b4c7e956e536de4345385761e2fac0d766168bb51bdeefac7bf4ff082c"

  url "https://github.com/Digital-Defiance/aider-vision/releases/download/v0.90.10.dev1/Aider.Vision_0.90.10.dev1_universal.dmg"
  name "Aider Vision"
  desc "A lightweight, cross-platform desktop application built with Tauri and React that provides a graphical interface to manage, configure, and interact with the Aider Vision Core AI coding assistant which is a headless version of Aider with some improvements."
  homepage "https://aider-vision.digitaldefiance.org"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Aider Vision.app"
end
