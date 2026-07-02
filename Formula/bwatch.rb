class Bwatch < Formula
  desc "Repeatedly run a command and display BrightDate timestamps with elapsed time"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_AFTER_RELEASE"
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
