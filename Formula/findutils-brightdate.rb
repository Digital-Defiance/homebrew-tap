class FindutilsBrightdate < Formula
  desc "GNU findutils with BrightDate time system (bfind, blocate, bupdatedb, bxargs)"
  homepage "https://github.com/Digital-Defiance/findutils-brightdate"
  license "GPL-3.0-or-later"

  head "https://github.com/Digital-Defiance/findutils-brightdate.git", branch: "main"

  # Build dependencies (needed to regenerate autotools files from HEAD)
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gettext" => :build

  def install
    system "autoreconf", "-fi"

    system "./configure",
           "--prefix=#{prefix}",
           "--mandir=#{man}",
           "--disable-dependency-tracking",
           "--disable-silent-rules",
           "--disable-nls"

    # Build support libraries, then each tool subdirectory
    system "make", "-C", "gl"
    system "make", "-C", "lib"
    system "make", "-C", "find", "bfind"
    system "make", "-C", "locate", "blocate", "bupdatedb"
    system "make", "-C", "xargs", "bxargs"

    # Install binaries
    bin.install "find/bfind"
    bin.install "locate/blocate"
    bin.install "locate/bupdatedb"
    bin.install "xargs/bxargs"

    # Install man pages
    man1.install "find/bfind.1"
    man1.install "locate/blocate.1"
    man1.install "locate/bupdatedb.1"
    man1.install "xargs/bxargs.1"
  end

  test do
    # Verify bfind is functional and reports a BrightDate-format mtime
    (testpath/"probe.txt").write("hello")
    output = shell_output("#{bin}/bfind #{testpath} -name probe.txt -printf '%Wt\\n'")
    assert_match(/\A\d+\.\d+\n\z/, output.strip + "\n")

    # Verify bxargs basic operation
    assert_equal "hello\n", shell_output("echo hello | #{bin}/bxargs echo")
  end
end
