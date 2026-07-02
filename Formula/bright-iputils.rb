class BrightIputils < Formula
  desc "Bright Spacetime/Date/Space-aware networking utilities"
  homepage "https://iputils.digitaldefiance.org"
  url "https://github.com/Digital-Defiance/bright-iputils/archive/refs/tags/20260523.tar.gz"
  sha256 "950ceb362d5383bb514cd35429267bdf7b36547b45cd4d9ec8f23a058f3af494"
  license "BSD-3-Clause"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "libidn2"

  def install
    system "meson", "setup", "builddir", *std_meson_args,
      "-DUSE_CAP=false",
      "-DUSE_IDN=true",
      "-DUSE_GETTEXT=false",
      "-DBUILD_MANS=false",
      "-DBUILD_HTML_MANS=false",
      "-DSKIP_TESTS=true"
    system "ninja", "-C", "builddir"
    system "ninja", "-C", "builddir", "install"
  end

  test do
    system "#{bin}/bping", "--version"
  end
end
