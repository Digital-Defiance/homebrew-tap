class Bdate < Formula
  desc "Date utility displaying time as BrightDate decimal days since J2000.0 epoch"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "2f6c32435d9f6681191eedc1cd4d5895075f2ae648860010cf46916a13646f3c"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "bdate"
    bin.install "target/release/bdate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bdate --version")
    # J2000.0 epoch (JD 2451545.0) should produce BrightDate 0.00000
    assert_match "0.00000", shell_output("#{bin}/bdate JD:2451545.0")
    # ISO 8601 of the epoch
    assert_match "0.00000", shell_output("#{bin}/bdate 2000-01-01T12:00:00Z")
  end
end
