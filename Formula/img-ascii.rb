class ImgAscii < Formula
  desc "画像からアスキーアートを生成するCLIツール"
  
  homepage "https://github.com/yudaitakeda/img-ascii"
  
  # 1. URLが v0.1.0 になっているか確認（なっていればそのままでOK）
  url "https://github.com/yudaitakeda/img-ascii/archive/refs/tags/v0.1.0.tar.gz"
  
  # 2. さっきの64文字のハッシュ値にそっくり入れ替える
  sha256 "9e87f1b42985e80c647f79dc8de96eb7059487ed3910e608794dced0357c48ea"

  # (以下、資料通りの install メソッドなどが続く...)
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")

    generate_completions_from_executable(
      bin/"img-ascii",
      "completions",
      shells: [:bash, :zsh, :fish, :powershell, :elvish],
    )
  end

  test do
    assert_match "img-ascii", shell_output("#{bin}/img-ascii --help")
  end
end
