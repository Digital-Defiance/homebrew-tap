class BrightIputils < Formula
  desc "Bright Spacetime/Date/Space-aware networking utilities"
  homepage "https://iputils.digitaldefiance.org"
  url "https://github.com/Digital-Defiance/bright-iputils/archive/refs/tags/20260523.tar.gz"
  sha256 "950ceb362d5383bb514cd35429267bdf7b36547b45cd4d9ec8f23a058f3af494"
  license "BSD-3-Clause"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "libidn2"

  # libbrightlink is consumed as a Meson subproject via a git submodule in
  # the upstream repo. GitHub's auto-generated source tarballs do NOT
  # include submodule contents, so we vendor it here as a Homebrew resource
  # pinned to the same commit the submodule points at.
  resource "libbrightlink" do
    url "https://github.com/Digital-Defiance/libbrightlink/archive/3b849664a5f3cbe0d7a44bde367077e45f140748.tar.gz"
    sha256 "86c9283d8c657b5a708f5c70560decaca8a5a810211ea7fcf91d5572e6eb70fb"
  end

  def install
    # Populate the (otherwise empty) submodule directory from the resource.
    subproj = buildpath/"subprojects/libbrightlink"
    subproj.rmtree if subproj.exist?
    resource("libbrightlink").stage(subproj)

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
