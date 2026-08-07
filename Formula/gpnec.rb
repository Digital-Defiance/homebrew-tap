class Gpnec < Formula
  desc "Metal/MPSGraph bridge for Subspace Lattice Sensor Net visuals"
  homepage "https://github.com/Digital-Defiance/gpnec"
  url "https://github.com/Digital-Defiance/gpnec/releases/download/v0.1.0/gpnec-0.1.0-macos-universal.tar.gz"
  sha256 "2dff55b7dbfc20cfc56fb9c91cf009ed01c169d96b03bdde3c7658ef0a86cccc"
  license "MIT"
  head "https://github.com/Digital-Defiance/gpnec.git", branch: "main"

  depends_on :macos
  depends_on macos: :sonoma

  def install
    lib.install "lib/libGPNECCBridge.dylib"
    include.install "include/gpnec.h"
  end

  def caveats
    <<~EOS
      Installed #{lib}/libGPNECCBridge.dylib

      Subspace Lattice (Developer ID / `brew install --cask subspace-lattice`)
      picks this up automatically for Metal Sensor Net heat maps.
      Relaunch the game after install. Web / Windows / MAS keep the CPU bloom.
    EOS
  end

  test do
    assert_predicate lib/"libGPNECCBridge.dylib", :exist?
  end
end
