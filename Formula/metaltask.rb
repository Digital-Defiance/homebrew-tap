class Metaltask < Formula
  desc "Native GPU task manager for Apple Silicon Macs"
  homepage "https://digital-defiance.github.io/MetalTask/"
  url "https://github.com/Digital-Defiance/MetalTask/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c4b0f7b42959349af4364aa2e6aaa5715e3f54baf546492b1ed221bd0676d5d9"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    swift = "/usr/bin/swift"
    build_dir = buildpath/"build-homebrew"
    args = ["--configuration", "release", "--scratch-path", build_dir.to_s]
    system swift, "build", *args
    products = Utils.safe_popen_read(swift, "build", *args, "--show-bin-path").strip
    system "/bin/bash", "scripts/package-app.sh", "#{products}/MetalTask", libexec, version.to_s
    bin.install_symlink libexec/"MetalTask.app/Contents/MacOS/MetalTask" => "metaltask"
  end

  test do
    assert_path_exists libexec/"MetalTask.app/Contents/Info.plist"
    output = shell_output("#{bin}/metaltask --sample-gpu")
    assert_match(/Device Utilization %:|GPU activity unavailable:/, output)
  end
end
