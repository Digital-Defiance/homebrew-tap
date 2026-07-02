class BshIputils < Formula
  desc "Bright Spacetime/Date/Space-aware networking utilities"
  homepage "https://iputils.digitaldefiance.org"
  url "https://github.com/Digital-Defiance/bsh-iputils/archive/refs/tags/20260520.tar.gz"
  sha256 "c08036c4379403527d25e5d6e880b8b075194b810698f3d006a96a89f5edd74c"
  license "BSD-3-Clause"

  depends_on "gettext"
  depends_on "meson"
  depends_on "ninja"
  depends_on "libidn2"
  depends_on "bsh"

  def install
    system "meson", "setup", "builddir", *std_meson_args, "-DUSE_CAP=false"
    system "ninja", "-C", "builddir"
    system "ninja", "-C", "builddir", "install"
  end

  test do
    system "#{bin}/bping", "--version"
  end
end
