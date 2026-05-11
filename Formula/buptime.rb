class Buptime < Formula
  desc "Show system uptime expressed in BrightDate decimal days"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d3a6e990d40b8e287509dde8462dfdcc10772738c76bac0b6aa2c163e03781e0"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "buptime"
    bin.install "target/release/buptime"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/buptime --version")
    output = shell_output("#{bin}/buptime")
    assert_match "up", output
    assert_match "days", output
    assert_match "millidays", output
  end
end
