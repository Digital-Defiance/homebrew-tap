class Btime < Formula
  desc "Time a command and display elapsed duration in BrightDate units"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "d05b79cb0c3a8f5bd17a03df0cd2423e9c42d7a7abb17e7c534fff75ea2e2970"
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
