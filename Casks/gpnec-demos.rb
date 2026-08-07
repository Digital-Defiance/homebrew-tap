cask "gpnec-demos" do
  version "0.2.1"
  sha256 "ac809775ae804a55bac35ccddbb7df29bee1cdaafc89b3788ff8e9c5260833ab"

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
