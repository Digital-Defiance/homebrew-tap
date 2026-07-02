class Buptime < Formula
  desc "Show system uptime expressed in BrightDate decimal days"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "cd44d3bf0cf08b0c1ccac9becaf261a24fea9df97ce35ec619f783582e78e76f"
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
