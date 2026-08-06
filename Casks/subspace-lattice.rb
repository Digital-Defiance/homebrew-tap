# Example Homebrew cask for digital-defiance/homebrew-tap.
# Copy to Casks/subspace-lattice.rb — cask token subspace-lattice; app/DMG use Subspace Lattice.
cask "subspace-lattice" do
  version "0.2.38"
  sha256 "32ddf4365f2d6dcd9b8fd9893e3cf07c57942a6d6c860951bae7af591677d0da"

  url "https://github.com/Digital-Defiance/subspace-lattice/releases/download/v#{version}/Subspace_Lattice_#{version}_universal.dmg"
  name "Subspace Lattice"
  desc "Federation-themed Chess + Go game variation (Tauri + React)"
  homepage "https://github.com/Digital-Defiance/subspace-lattice"

  app "Subspace Lattice.app"

  zap trash: [
    "~/Library/Application Support/org.digitaldefiance.app.subspacelattice",
    "~/Library/Caches/org.digitaldefiance.app.subspacelattice",
    "~/Library/Preferences/org.digitaldefiance.app.subspacelattice.plist",
    "~/Library/Saved Application State/org.digitaldefiance.app.subspacelattice.savedState",
  ]
end
