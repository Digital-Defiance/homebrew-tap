class Bsh < Formula
  desc "BrightShell — zsh fork with native BrightDate builtins and Secure Data Injection (bsh/sdi)"
  homepage "https://github.com/Digital-Defiance/bsh"
  url "https://github.com/Digital-Defiance/bsh/archive/refs/tags/bsh-5.11.1.tar.gz"
  sha256 "076e09e0f8b175e94b65f2f6f051a52737413954a8d47d2825a33e7d53e2f65c"
  version "5.11.1"
  license "MIT"
  head "https://github.com/Digital-Defiance/bsh.git", branch: "main"

  depends_on "autoconf" => :build
  depends_on "rust" => :build
  depends_on "ncurses"
  depends_on "openssl@3"

  resource "brightdate-rust" do
    url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.1.4.tar.gz"
    sha256 "966740870848459ac592ddd0146705a1334d9f216f2f086d9d71525bec52c9f1"
  end

  def install
    # config.h.in and configure are gitignored; regenerate both
    system "autoheader"
    system "autoconf"
    # The tarball includes an empty brightdate-rust/ submodule stub; remove it before staging
    rm_rf buildpath/"brightdate-rust"
    # brightdate-rust must sit at $(sdir_top)/brightdate-rust relative to the bsh root
    resource("brightdate-rust").stage(buildpath/"brightdate-rust")
    openssl = Formula["openssl@3"].opt_prefix
    system "./configure", "--prefix=#{prefix}",
                          "--bindir=#{bin}",
                          "--mandir=#{man}",
                          "--infodir=#{info}",
                          "--enable-multibyte",
                          "--enable-function-subdirs",
                          "CPPFLAGS=-I#{openssl}/include",
                          "LDFLAGS=-L#{openssl}/lib"
    system "make"
    system "make", "install.bin", "install.modules", "install.fns"
  end

  test do
    assert_match "5.11.0", shell_output("#{bin}/bsh --version")
    assert_equal "hello\n", shell_output("#{bin}/bsh -c 'echo hello'")
    # Verify the SDI module built and the builtin is registered
    assert_match "bsh-inject", shell_output("#{bin}/bsh -c 'zmodload bsh/sdi; echo bsh-inject'")
    # Verify ls -l shows symlink targets (BrightDate format + arrow)
    (testpath/"target.txt").write("hi")
    (testpath/"link.txt").make_symlink("target.txt")
    ls_out = shell_output("#{bin}/bsh -c 'zmodload bsh/files; ls -l #{testpath}/link.txt'")
    assert_match "->", ls_out
    assert_match "target.txt", ls_out
  end
end
