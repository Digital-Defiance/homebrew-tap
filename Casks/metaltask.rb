cask "metaltask" do
  version "0.3.0"
  sha256 "e77f0597f6c502e35a76348517c64486adcfbc2b3d5e35bb5cbca9ae98464ebd"

  url "https://github.com/Digital-Defiance/MetalTask/releases/download/v#{version}/MetalTask-#{version}-arm64.dmg"
  name "MetalTask"
  desc "Native GPU task manager for Apple Silicon Macs"
  homepage "https://metaltask.digitaldefiance.org/"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MetalTask.app"
end
