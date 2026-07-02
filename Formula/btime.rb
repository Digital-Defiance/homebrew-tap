class Btime < Formula
  desc "Time a command and display elapsed duration in BrightDate units"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d3a6e990d40b8e287509dde8462dfdcc10772738c76bac0b6aa2c163e03781e0"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "btime"
    bin.install "target/release/btime"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/btime --version")
    # Time a trivially fast command; stderr should contain elapsed in millidays
    output = shell_output("#{bin}/btime true 2>&1")
    assert_match "real", output
    assert_match "millidays", output
  end
end
