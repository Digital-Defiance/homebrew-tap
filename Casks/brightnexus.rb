cask "brightnexus" do
  version "1.0.9"
  sha256 "3d8f917ea43098e98820a25d983aec42e3c17888880fa8ef33a286b49a08cb36"

  url "https://github.com/Digital-Defiance/BrightNexus/releases/download/v1.0.9/BrightNexus-1.0.9.zip"
  name "BrightNexus"
  desc "Secure Enclave bridge and BrightLink credential agent"
  homepage "https://github.com/Digital-Defiance/BrightNexus"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "BrightNexus.app"

  caveats do
    <<~MSG
      BrightNexus listens on a local Unix socket at:
        ~/.brightchain/brightnexus/brightnexus.sock

      First-run housekeeping:
        - Open System Settings > Privacy & Security > Location Services
          and toggle BrightNexus on if you want the BrightLink geo
          surface (LINK_GEO_*) to return real coordinates.
        - Optionally enable Login Items in the BrightNexus dropdown menu
          so it starts at boot.

      Apple Silicon only - the Secure Enclave is required for
      BridgeIdentity signing. Intel Macs are not supported.

      No App Store, no telemetry, no network connections - everything
      runs locally on your Mac. Bundle ID: org.digitaldefiance.brightchain.BrightNexus.
    MSG
  end
end
