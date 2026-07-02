class Bwatch < Formula
  desc "Repeatedly run a command and display BrightDate timestamps with elapsed time"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "6368a8228d676ffc4fa6ff9399a94210938788321c0a6937c323b1158b99d577"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "bwatch"
    bin.install "target/release/bwatch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bwatch --version")
    # --count 1 runs once and exits; header line should contain BD: timestamp
    output = shell_output("#{bin}/bwatch --count 1 true")
    assert_match "BD:", output
    assert_match "elapsed", output
  end
end
