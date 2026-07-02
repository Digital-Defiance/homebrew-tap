class Bdate < Formula
  desc "Date utility displaying time as BrightDate decimal days since J2000.0 epoch"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "6368a8228d676ffc4fa6ff9399a94210938788321c0a6937c323b1158b99d577"
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
