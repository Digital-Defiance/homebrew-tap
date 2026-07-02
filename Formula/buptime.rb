class Buptime < Formula
  desc "Show system uptime expressed in BrightDate decimal days"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "2f6c32435d9f6681191eedc1cd4d5895075f2ae648860010cf46916a13646f3c"
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
