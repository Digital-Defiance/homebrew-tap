class Gpnec < Formula
  desc "Metal/MPSGraph bridge for Subspace Lattice Sensor Net visuals"
  homepage "https://github.com/Digital-Defiance/gpnec"
  url "https://github.com/Digital-Defiance/gpnec/releases/download/v0.2.1/gpnec-0.2.1-macos-universal.tar.gz"
  sha256 "e16256486434f842db5787a290a5430c4306a0a17a6c206803be0ef5482e6d8c"
  license "MIT"
  head "https://github.com/Digital-Defiance/gpnec.git", branch: "main"

  on_macos do
    depends_on macos: :sonoma
  end

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
