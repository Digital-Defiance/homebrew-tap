class Bsh < Formula
  desc "BrightShell - zsh fork with native BrightDate builtins and BrightLink agent"
  homepage "https://github.com/Digital-Defiance/bsh"
  url "https://github.com/Digital-Defiance/bsh/archive/refs/tags/v5.14.3.tar.gz"
  version "5.14.3"
  sha256 "6bc4291a49994f0d254c8dcc0eb67017912af4305e475495063318be9fb776dc"
  license "MIT"
  head "https://github.com/Digital-Defiance/bsh.git", branch: "main"

  depends_on "autoconf" => :build
  depends_on "rust" => :build
  depends_on "ncurses"
  depends_on "openssl@3"
  depends_on "secp256k1"

  resource "brightdate-rust" do
    url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.5.2.tar.gz"
    sha256 "cd44d3bf0cf08b0c1ccac9becaf261a24fea9df97ce35ec619f783582e78e76f"
  end

  def install
    # config.h.in and configure are gitignored; regenerate both
    system "autoheader"
    system "autoconf"
    # The tarball includes an empty brightdate-rust/ submodule stub; remove it before staging
    rm_r(buildpath/"brightdate-rust")
    # brightdate-rust must sit at $(sdir_top)/brightdate-rust relative to the bsh root
    resource("brightdate-rust").stage(buildpath/"brightdate-rust")
    openssl   = Formula["openssl@3"].opt_prefix
    secp256k1 = Formula["secp256k1"].opt_prefix
    system "./configure", "--prefix=#{prefix}",
                          "--bindir=#{bin}",
                          "--mandir=#{man}",
                          "--infodir=#{info}",
                          "--enable-multibyte",
                          "--enable-function-subdirs",
                          "CPPFLAGS=-I#{openssl}/include -I#{secp256k1}/include",
                          "LDFLAGS=-L#{openssl}/lib -L#{secp256k1}/lib"
    system "make"
    system "make", "install.bin", "install.modules", "install.fns"
  end

  test do
    assert_match "5.14.3", shell_output("#{bin}/bsh --version")
    assert_equal "hello\n", shell_output("#{bin}/bsh -c 'echo hello'")
    # Verify the BrightLink module built and both builtins are registered
    out = shell_output("#{bin}/bsh -c 'zmodload bsh/brightlink; whence -v bsh-inject link-geo'")
    assert_match "bsh-inject", out
    assert_match "link-geo", out
    # Verify ls -l shows symlink targets (BrightDate format + arrow)
    (testpath/"target.txt").write("hi")
    (testpath/"link.txt").make_symlink("target.txt")
    ls_out = shell_output("#{bin}/bsh -c 'zmodload bsh/files; ls -l #{testpath}/link.txt'")
    assert_match "->", ls_out
    assert_match "target.txt", ls_out
  end
end
