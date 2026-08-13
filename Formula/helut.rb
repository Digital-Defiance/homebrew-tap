class Helut < Formula
  desc "Homomorphic Edge Look-Up Tensors — Metal netlist FHE research CLIs"
  homepage "https://helut.digitaldefiance.org"
  license "MIT"
  head "https://github.com/Digital-Defiance/HELUT.git", branch: "main"

  # After tagging HELUT 0.1.0 and computing sha256 (from HELUT checkout):
  #   ./Scripts/homebrew-bump.sh 0.1.0
  # uncomment and fill:
  #
  # url "https://github.com/Digital-Defiance/HELUT/archive/refs/tags/0.1.0.tar.gz"
  # version "0.1.0"
  # sha256 "REPLACE_ME"
  #
  # Until then: brew install --HEAD digital-defiance/homebrew-tap/helut

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  on_macos do
    depends_on arch: :arm64
  end

  def install
    # Homebrew sandbox fights SwiftPM caches; Metal stack needs a full Xcode toolchain.
    ENV["SWIFTPM_DISABLE_SANDBOX"] = "1"
    system "swift", "build", "-c", "release", "--disable-sandbox"

    %w[helut helut-bench helut-e256 helut-bombe helut-compile].each do |name|
      bin.install ".build/release/#{name}"
    end

    doc.install "HOMEBREW.md" if File.exist?("HOMEBREW.md")
    doc.install "REPRODUCE.md" if File.exist?("REPRODUCE.md")
  end

  test do
    assert_match "helut-bench", shell_output("#{bin}/helut 2>&1", 2)
    assert_match "Label", shell_output("#{bin}/helut-bench --hardness-table")
  end
end
