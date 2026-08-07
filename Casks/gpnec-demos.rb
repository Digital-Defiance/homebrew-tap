cask "gpnec-demos" do
  version "0.1.0"
  sha256 "f2d18f9819362824bc72c8f320c959304f94ea112159456b98b4b333cb18096b"

  url "https://github.com/Digital-Defiance/gpnec/releases/download/v#{version}/gpnec-demos-#{version}-macos-universal.zip"
  name "GPNEC Demos"
  desc "Metal demos: Lattice Boltzmann fluid + Euclidean/Poincaré routing sandbox"
  homepage "https://github.com/Digital-Defiance/gpnec"

  depends_on macos: :sonoma

  app "GPNEC Fluid.app"
  app "GPNEC Route.app"

  caveats <<~EOS
    Launch from Applications / Spotlight:

      open -a "GPNEC Fluid"   # LBM — click/drag droplets
      open -a "GPNEC Route"   # dual routing — press CRASH BACKBONE

    Sensor Net for Subspace Lattice is separate: brew install gpnec
  EOS

  zap trash: [
    "~/Library/Saved Application State/org.digitaldefiance.gpnec.fluid.savedState",
    "~/Library/Saved Application State/org.digitaldefiance.gpnec.route.savedState",
  ]
end
