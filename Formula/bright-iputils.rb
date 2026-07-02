class BrightIputils < Formula
  desc "Bright Spacetime/Date/Space-aware networking utilities"
  homepage "https://iputils.digitaldefiance.org"
  url "https://github.com/Digital-Defiance/bright-iputils/archive/refs/tags/20260524.tar.gz"
  sha256 "f5f24813e7707918d8bce154de3d00322d9ec9359531e0528268a7a5161ab15d"
  license "BSD-3-Clause"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "libidn2"
  depends_on "openssl@3"
  depends_on "secp256k1"

  # libbrightlink is consumed as a Meson subproject via a git submodule in
  # the upstream repo. GitHub's auto-generated source tarballs do NOT
  # include submodule contents, so we vendor it here as a Homebrew resource
  # pinned to the same commit the submodule points at.
  resource "libbrightlink" do
    url "https://github.com/Digital-Defiance/libbrightlink/archive/8536e49198dfa71ae016e3e67993f9282c4a473f.tar.gz"
    sha256 "370a56966fd67e809d180822cb47e494f0b44119099831745512eb0b6e53e9a9"
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
