class Metaltask < Formula
  desc "Native GPU task manager for Apple Silicon Macs"
  homepage "https://metaltask.digitaldefiance.org/"
  url "https://github.com/Digital-Defiance/MetalTask/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "eae221e82bb9fd3bb2444256fca3e666106f735e6da7f6a58b476b4b9319c6e5"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    swift = "/usr/bin/swift"
    build_dir = buildpath/"build-homebrew"
    # Homebrew already restricts the build. SwiftPM cannot nest its manifest sandbox.
    ENV["CLANG_MODULE_CACHE_PATH"] = buildpath/"clang-module-cache"
    args = ["--configuration", "release", "--scratch-path", build_dir.to_s, "--disable-sandbox"]
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
