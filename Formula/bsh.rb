class Bsh < Formula
  desc "BrightShell — zsh fork with native BrightDate builtins (bdate, btime, bcal, buptime, bwatch)"
  homepage "https://github.com/Digital-Defiance/bsh"
  url "https://github.com/Digital-Defiance/bsh/archive/refs/tags/bsh-5.9.0.14.tar.gz"
  sha256 "b97f84ac57466fcd8ae369272277101b7055f041ba2574bf008604d8c3d821ac"
  version "5.9.0.14"
  license "MIT"
  head "https://github.com/Digital-Defiance/bsh.git", branch: "main"

  depends_on "autoconf" => :build
  depends_on "rust" => :build
  depends_on "ncurses"

  resource "brightdate-rust" do
    url "https://github.com/Digital-Defiance/brightdate-rust/archive/refs/tags/v0.1.3.tar.gz"
    sha256 "2398400e7ba8149080952d71bd259a0d88fd0c7da224e73fdf243d89b08fa68d"
  end

  def install
    # config.h.in and configure are gitignored; regenerate both
    system "autoheader"
    system "autoconf"
    # The tarball includes an empty brightdate-rust/ submodule stub; remove it before staging
    rm_rf buildpath/"brightdate-rust"
    # brightdate-rust must sit at $(sdir_top)/brightdate-rust relative to the bsh root
    resource("brightdate-rust").stage(buildpath/"brightdate-rust")
    system "./configure", "--prefix=#{prefix}",
                          "--bindir=#{bin}",
                          "--mandir=#{man}",
                          "--infodir=#{info}",
                          "--enable-multibyte",
                          "--enable-function-subdirs",
                          "--with-tcsetpgrp"
    system "make"
    system "make", "install.bin", "install.modules", "install.fns"
  end

  test do
    assert_match "5.9.0.14", shell_output("#{bin}/bsh --version")
    assert_match "bsh", shell_output("#{bin}/bsh --version")
    assert_equal "hello\n", shell_output("#{bin}/bsh -c 'echo hello'")
  end
end
