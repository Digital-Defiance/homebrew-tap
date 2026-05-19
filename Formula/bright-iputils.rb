class BrightIputils < Formula
  desc "Bright Spacetime/Date/Space-aware networking utilities"
  homepage "https://iputils.digitaldefiance.org"
  url "https://github.com/Digital-Defiance/bright-iputils/archive/refs/tags/20260519.tar.gz"
  sha256 "bbd2f5ab071b664981fc7f69559f1d447e8dc8ab0873a4b39fc519bd5d966aec"
  license "BSD-3-Clause"

  depends_on "gettext"
  depends_on "meson"
  depends_on "ninja"
  depends_on "libidn2"

  def install
    system "meson", "setup", "builddir", *std_meson_args, "-DUSE_CAP=false"
    system "ninja", "-C", "builddir"
    system "ninja", "-C", "builddir", "install"
  end

  test do
    system "#{bin}/bping", "--version"
  end
end
