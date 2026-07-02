class Btime < Formula
  desc "Time a command and display elapsed duration in BrightDate units"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "6368a8228d676ffc4fa6ff9399a94210938788321c0a6937c323b1158b99d577"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "btime"
    bin.install "target/release/btime"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/btime --version")
    assert_match "--color", shell_output("#{bin}/btime --help")
    # Time a trivially fast command; stderr should contain elapsed in millidays
    output = shell_output("#{bin}/btime true 2>&1")
    assert_match "real", output
    assert_match "millidays", output
  end
end
