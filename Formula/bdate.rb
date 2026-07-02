class Bdate < Formula
  desc "Date utility displaying time as BrightDate decimal days since J2000.0 epoch"
  homepage "https://github.com/Digital-Defiance/brightdate-rust"
  url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "6af51dd3e37d1450bbac9128257d4d426ce4a7816d572bc1aae3b24acb9afec4"
  license "MIT"
  head "https://github.com/Digital-Defiance/brightdate-rust.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--package", "bdate"
    bin.install "target/release/bdate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bdate --version")
    # J2000.0 epoch (JD 2451545.0) should produce BrightDate 0.00000
    assert_match "0.00000", shell_output("#{bin}/bdate JD:2451545.0")
    # ISO 8601 of the epoch
    assert_match "0.00000", shell_output("#{bin}/bdate 2000-01-01T12:00:00Z")
  end
end
