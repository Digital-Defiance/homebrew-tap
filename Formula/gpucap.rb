class Gpucap < Formula
  desc "Run a command and report GPU, CPU, and unified memory usage on Apple Silicon"
  homepage "https://github.com/Digital-Defiance/gpucap"
  url "https://static.crates.io/crates/gpucap/gpucap-0.1.0.crate"
  sha256 "9fc6f08f1c56de96eb5dbd85e1459be827cfc3cb84e92ce5536b80b9a982ea55"
  license "MIT"
  head "https://github.com/Digital-Defiance/gpucap.git", branch: "main"

  depends_on "rust" => :build

  on_macos do
    depends_on arch: :arm64
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gpucap --version")
    assert_match "--color", shell_output("#{bin}/gpucap --help")
    assert_match "--percent", shell_output("#{bin}/gpucap gpuexercise --help")
    output = shell_output("#{bin}/gpucap --no-color true 2>&1")
    assert_match "gpu", output
    assert_match "cpu", output
    assert_match "memory", output
  end
end
