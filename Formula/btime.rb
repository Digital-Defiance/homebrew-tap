class Btime < Formula
  desc "Time a command and display elapsed duration in BrightDate units"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "966740870848459ac592ddd0146705a1334d9f216f2f086d9d71525bec52c9f1"
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
