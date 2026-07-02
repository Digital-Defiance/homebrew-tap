class Bcal < Formula
  desc "Calendar utility showing BrightDate values for each day"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "6368a8228d676ffc4fa6ff9399a94210938788321c0a6937c323b1158b99d577"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "bcal"
    bin.install "target/release/bcal"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bcal --version")
    # January 2000 header should appear; J2000.0 epoch day = BrightDate 0.00
    output = shell_output("#{bin}/bcal 2000 1")
    assert_match "January 2000", output
    assert_match "0.00", output
    # Jan 31 at noon = BrightDate 30.00
    assert_match "30.00", output
  end
end
