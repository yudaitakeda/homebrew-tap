class ImgAscii < Formula
  desc "画像からアスキーアートを生成するCLIツール"
  homepage "https://github.com/yudaitakeda/img-ascii"
  url "https://github.com/yudaitakeda/img-ascii/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9e87f1b42985e80c647f79dc8de96eb7059487ed3910e608794dced0357c48ea"
  license "MIT"

  depends_on "rust" => :build

  def install
    # これだけでバイナリのビルドと配置をすべて自動で行ってくれます
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "img-ascii", shell_output("#{bin}/img-ascii --help")
  end
end
