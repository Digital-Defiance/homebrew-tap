class Gpucap < Formula
  desc "Run a command and report GPU, CPU, and unified memory usage on Apple Silicon"
  homepage "https://github.com/Digital-Defiance/gpucap"
  url "https://static.crates.io/crates/gpucap/gpucap-0.1.2.crate"
  sha256 "fc9a6cac30d6d03ec190d627d6b738159afcae55166865531a7320e7f0b5b14c"
  license "MIT"
  head "https://github.com/Digital-Defiance/gpucap.git", branch: "main"

  depends_on "rust" => :build

  on_macos do
    depends_on arch: :arm64
  end

  def install
    system "cargo", "install", *std_cargo_args
    # Backward-compatible alias (crate is gpucap; Bright CLI is bgpucap).
    bin.install_symlink bin/"bgpucap" => "gpucap"
    man1.install "man/bgpucap.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bgpucap --version")
    assert_match version.to_s, shell_output("#{bin}/gpucap --version")
    assert_match "--color", shell_output("#{bin}/bgpucap --help")
    assert_match "--format", shell_output("#{bin}/bgpucap --help")
    assert_match "--percent", shell_output("#{bin}/bgpucap gpuexercise --help")
    assert_path_exists man1/"bgpucap.1"
    output = shell_output("#{bin}/bgpucap --no-color true 2>&1")
    assert_match "gpu", output
    assert_match "cpu", output
    assert_match "memory", output
  end
end
