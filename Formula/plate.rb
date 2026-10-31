class Plate < Formula
  include Language::Python::Virtualenv

  desc "Raster-to-SVG with editable layers, primitives, strokes and gradients"
  homepage "https://github.com/Digital-Defiance/PLATE"
  url "https://github.com/Digital-Defiance/PLATE/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8ade669db6fe0df7cdca402c9a6c5b2c1f69d54dd3ead3a115fab32052aaa454"
  license "MIT"
  head "https://github.com/Digital-Defiance/PLATE.git", branch: "main"

  depends_on "cairo" # SVG rendering for --report, bench and sweep SSIM
  depends_on :macos
  depends_on "python@3.14"

  # Prebuilt PyPI wheels pinned to the versions PLATE's test suite runs against
  # (regenerate with scripts/make_brew_formula.py in the PLATE repo).
  on_arm do
    depends_on macos: :ventura

    resource "numpy" do
      url "https://files.pythonhosted.org/packages/8e/62/764ce66fa4147ae6d73071a3abf804ffe606f174618697c571acdf26a7c9/numpy-2.4.6-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "38efbc8de75c7a0fc1ac190162d892787f3f47b57cc291231aafee36b80982b7"
    end

    resource "scipy" do
      url "https://files.pythonhosted.org/packages/ed/a6/d05a85fd51daeb2e4ea71d102f15b34fedca8e931af02594193ae4fd25f7/scipy-1.17.1-cp314-cp314-macosx_12_0_arm64.whl"
      sha256 "45abad819184f07240d8a696117a7aacd39787af9e0b719d00285549ed19a1e9"
    end

    resource "opencv-python-headless" do
      url "https://files.pythonhosted.org/packages/53/7c/8c8097891c509d98cd128493835c95631c80be6a8f37ed9d25716c2e16f1/opencv_python_headless-5.0.0.93-cp37-abi3-macosx_13_0_arm64.whl"
      sha256 "030ca5e0837a2963ab36ef896baa9767eb8d2b83353fb28af5a521e40dd8756f"
    end

    resource "pillow" do
      url "https://files.pythonhosted.org/packages/b5/f4/0bf6f1ac9ba7ee2ffe9914aeb410a1035a0c1a3c42f122388d7fc950bc4b/pillow-13.0.0-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "d9b0a2bee3f3e03e9f29057aedb807dbf1e1d96ee1b9d0f422d9db6c8583271d"
    end

    resource "scikit-image" do
      url "https://files.pythonhosted.org/packages/40/f5/83590d9355191f86ac663420fec741b82cc547a4afe7c4c1d986bf46e4db/scikit_image-0.26.0-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "ce00600cd70d4562ed59f80523e18cdcc1fae0e10676498a01f73c255774aefd"
    end

    resource "vtracer" do
      url "https://files.pythonhosted.org/packages/ca/c6/22c009b147de23fb8d1b18587ec303ab99fe4af423802185a2991a0a5bc4/vtracer-0.6.15-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "a845d023d5704eb4edf017cb4e57cad2c7dec36d80160b7f6eab744ca8121e68"
    end

    resource "cffi" do
      url "https://files.pythonhosted.org/packages/b3/a9/9db617d05d7367c1ad0ab00b3aa6e6f9281edd689b4ee9ea0e5a84e89c97/cffi-2.1.1-cp314-cp314-macosx_11_0_arm64.whl"
      sha256 "661c298b4821edebead0c91edd2b00374d67ad7c5a1f7a91d4442633b79d6a72"
    end
  end

  on_intel do
    depends_on macos: :sonoma

    resource "numpy" do
      url "https://files.pythonhosted.org/packages/f8/91/3ab2044d05fd16d343c5ac2e69b127f1b2854040dd20b193257c78028bd3/numpy-2.4.6-cp314-cp314-macosx_10_15_x86_64.whl"
      sha256 "06ca2f61ec4385a07a6977c55ba998a4466c123642b4a32694d3128fce18c079"
    end

    resource "scipy" do
      url "https://files.pythonhosted.org/packages/cf/83/333afb452af6f0fd70414dc04f898647ee1423979ce02efa75c3b0f2c28e/scipy-1.17.1-cp314-cp314-macosx_10_14_x86_64.whl"
      sha256 "a48a72c77a310327f6a3a920092fa2b8fd03d7deaa60f093038f22d98e096717"
    end

    resource "opencv-python-headless" do
      url "https://files.pythonhosted.org/packages/90/8c/eab2ad388c3cbab2a350c10c2ef19ce6bd099240afc31789032c996bab52/opencv_python_headless-5.0.0.93-cp37-abi3-macosx_14_0_x86_64.whl"
      sha256 "1e55af3abfb462eeeabe5c775f12bdb36216d8a93a3583d69e6bd6e1d6ba7d00"
    end

    resource "pillow" do
      url "https://files.pythonhosted.org/packages/84/a1/be060135d85187b25fa8b2573786c0e45c62ae27527fff5257675eb97f4a/pillow-13.0.0-cp314-cp314-macosx_10_15_x86_64.whl"
      sha256 "49c12af515073e9bf511e4ef736743bf70d531a643668722279314b937742ba4"
    end

    resource "scikit-image" do
      url "https://files.pythonhosted.org/packages/51/44/6b744f92b37ae2833fd423cce8f806d2368859ec325a699dc30389e090b9/scikit_image-0.26.0-cp314-cp314-macosx_10_15_x86_64.whl"
      sha256 "63af3d3a26125f796f01052052f86806da5b5e54c6abef152edb752683075a9c"
    end

    resource "vtracer" do
      url "https://files.pythonhosted.org/packages/58/84/8b269b73dd0b0f662dc11b6f9ae695ce98b98103cb9248c097e4c1d406f0/vtracer-0.6.15-cp314-cp314-macosx_10_12_x86_64.whl"
      sha256 "51b9069e87ea022249352f585a2774a07db7434743b8ddae5e49761c33412ceb"
    end

    resource "cffi" do
      url "https://files.pythonhosted.org/packages/d9/99/c4b0c17cacdc9c3b8f280026286a9826d6a208c0f047591a3c3ce99b91fd/cffi-2.1.1-cp314-cp314-macosx_10_15_x86_64.whl"
      sha256 "d28630f5854ab07ab1fd4aba756de52326c82e6be15d414b12793f1975048b54"
    end
  end

  # Prebuilt wheels name their extension modules @rpath/...; vtracer's has no
  # Mach-O header padding, so rewriting its ID to an absolute path fails.
  preserve_rpath

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/9e/c9/b2622292ea83fbb4ec318f5b9ab867d0a28ab43c5717bb85b0a5f6b3b0a4/networkx-3.6.1-py3-none-any.whl"
    sha256 "d47fbf302e7d9cbbb9e2555a0d267983d2aa476bac30e90dfbe5669bd57f3762"
  end

  resource "imageio" do
    url "https://files.pythonhosted.org/packages/7d/8a/3b7f62b9df56460959f1b9bef094248d2a4d7f393c5b0d2da8efcdf0e40e/imageio-2.38.1-py3-none-any.whl"
    sha256 "36d23eb7423d2fb63f637098758edb3d2df3687f7125e0a5ce8596572022dcf9"
  end

  resource "tifffile" do
    url "https://files.pythonhosted.org/packages/1a/e4/e804505f87627cd8cdae9c010c47c4485fd8c1ce31a7dd0ab7fcc4707377/tifffile-2026.3.3-py3-none-any.whl"
    sha256 "e8be15c94273113d31ecb7aa3a39822189dd11c4967e3cc88c178f1ad2fd1170"
  end

  resource "lazy-loader" do
    url "https://files.pythonhosted.org/packages/23/93/4e45e37f26c820216704b36b8e67cc55c490a7abd287a78a26a2c0e21386/lazy_loader-0.6-py3-none-any.whl"
    sha256 "77253be3391b06124a0e16105bd663b6c54470af1a9ca8e1cf026f38d58ed056"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/63/34/ba1c580383c9eada3711951fef0795c80b829a078d72188184bcab9dd527/packaging-26.3-py3-none-any.whl"
    sha256 "d7193f7c8e4e93f444fde0262bf90af30e16fa0ad0ad44cb553c87339b23cd1c"
  end

  resource "cairosvg" do
    url "https://files.pythonhosted.org/packages/41/51/8041c2e70649e5b7f2a0aedbbbd0609ac099cfaa0cbde2014279c9c05756/cairosvg-2.9.1-py3-none-any.whl"
    sha256 "f91c5628e834be024a0ed4544d76261cd84016a4c73bcdf26c386495825c05a1"
  end

  resource "cairocffi" do
    url "https://files.pythonhosted.org/packages/93/d8/ba13451aa6b745c49536e87b6bf8f629b950e84bd0e8308f7dc6883b67e2/cairocffi-1.7.1-py3-none-any.whl"
    sha256 "9803a0e11f6c962f3b0ae2ec8ba6ae45e957a146a004697a1ac1bbf16b073b3f"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/b6/ae/315bbeee126a769cbde43cf4908acb4b40408d8bf8bbf334dd7368d8dadf/pycparser-3.12-py3-none-any.whl"
    sha256 "a076f3f489b39b43ed13563a1dafe42447445bec2e294154ec5c57fcdda4c85e"
  end

  resource "cssselect2" do
    url "https://files.pythonhosted.org/packages/bd/59/6b1daa3b94de8970e2a2787ba73616c2d0675d2f948ef4cad8bef7f21bc6/cssselect2-0.10.1-py3-none-any.whl"
    sha256 "25cc4494d55985d6a6da359be48da6ce98c28dcbafa2314c383ace3fc32ec868"
  end

  resource "tinycss2" do
    url "https://files.pythonhosted.org/packages/60/45/c7b5c3168458db837e8ceab06dc77824e18202679d0463f0e8f002143a97/tinycss2-1.5.1-py3-none-any.whl"
    sha256 "3415ba0f5839c062696996998176c4a3751d18b7edaaeeb658c9ce21ec150661"
  end

  resource "webencodings" do
    url "https://files.pythonhosted.org/packages/77/c6/040cbc72480d789a5f40d63fb484d3106554c4dfa2d2b70ad5022057750f/webencodings-0.6.1-py3-none-any.whl"
    sha256 "7fab6269c8bf237c657876b52058ccb182e861518d1c695c1a9aaa8c1c105d5b"
  end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/07/6c/aa3f2f849e01cb6a001cd8554a88d4c77c5c1a31c95bdf1cf9301e6d9ef4/defusedxml-0.7.1-py2.py3-none-any.whl"
    sha256 "a352e7e428770286cc899e2542b6cdaedb2b4953ff269a210103ec58f6198a61"
  end

  # Build backend for PLATE itself (pip runs without network or build isolation).
  resource "hatchling" do
    url "https://files.pythonhosted.org/packages/32/64/4afe5dd77b2939a93e8c9513f8082dbd049ecba9c1484a379a0f6ae29d6b/hatchling-1.33.0-py3-none-any.whl"
    sha256 "415290b84f464d2884303fca8974d38e7b85579069fab02a15db0828fbb1446d"
  end

  resource "pathspec" do
    url "https://files.pythonhosted.org/packages/f1/d9/7fb5aa316bc299258e68c73ba3bddbc499654a07f151cba08f6153988714/pathspec-1.1.1-py3-none-any.whl"
    sha256 "a00ce642f577bf7f473932318056212bc4f8bfdf53128c78bbd5af0b9b20b189"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/40/9e/2b38731e0fc536806f16490e1a12d7f0dc2a1235aa8cc07bcc75416a7daa/pluggy-1.7.0-py3-none-any.whl"
    sha256 "7dd7b0d8832ba3cb632c306926ded123429211b83641b35dc5c41ad2d34f9bec"
  end

  resource "trove-classifiers" do
    url "https://files.pythonhosted.org/packages/30/81/0da8afb52a71d0a4f2bd3152357b1a441e393b286374802b9d3addab4ab5/trove_classifiers-2026.9.21.13-py3-none-any.whl"
    sha256 "8b1ff4f9c191b1040b71c37f1e445ab99732911e3cd91de52838453a854d7a17"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/da/46/7d84138a60a8bd796825b2d38ebe92d0d16501ca57d501b7c5d677401bbc/tomlkit-0.15.2-py3-none-any.whl"
    sha256 "05562412163a3037b94497385fb7f9204c637bc605af7a48199e41cf2272f437"
  end

  def install
    python = formula_opt_bin("python@3.14")/"python3.14"
    venv = virtualenv_create(libexec, python, system_site_packages: false)
    wheels = buildpath/"wheels"
    wheels.mkpath
    # pip reads a wheel's tags from its filename, so restore the canonical name.
    resources.each { |r| cp r.cached_download, wheels/File.basename(URI(r.url).path) }
    pip = [python, "-m", "pip", "--python=#{venv.root}/bin/python", "install",
           "--no-deps", "--no-index", "--find-links=#{wheels}", "--no-compile"]
    system(*pip, *wheels.children.map(&:to_s))
    system(*pip, "--no-build-isolation", buildpath)
    bin.install_symlink libexec/"bin/plate"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plate --version")
    system libexec/"bin/python", "-c", <<~PYTHON
      from PIL import Image, ImageDraw
      im = Image.new("RGB", (96, 64), "white")
      ImageDraw.Draw(im).rectangle([12, 10, 60, 46], fill=(200, 40, 40))
      im.save("in.png")
    PYTHON
    system bin/"plate", "trace", "in.png", "-o", "out.svg"
    svg = (testpath/"out.svg").read
    assert_match "<rect", svg
    assert_match "#c82828", svg
    assert_match "renderer ready", shell_output("#{bin}/plate doctor --vlm-url http://127.0.0.1:9/v1")
    assert_match "not a recognised image", shell_output("#{bin}/plate trace #{test_fixtures("test.svg")} 2>&1", 2)
  end
end
