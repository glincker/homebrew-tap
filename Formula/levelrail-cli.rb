class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.14/levelrail-cli-darwin-arm64"
      sha256 "cad0b6bcf9e6b32d5a2688ee433c9d88544fcead1c2a96910c27a84b33528efd"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.14/levelrail-cli-darwin-amd64"
      sha256 "04e0685c7c19a2549b07f32721889e391c3fb826ddf433ddb7a39b2fb57d7f5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.14/levelrail-cli-linux-arm64"
      sha256 "bb5db14e959b3df470366d0ef4134a0a46ba528d8f10cf9db489fe45b34b6bd6"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.14/levelrail-cli-linux-amd64"
      sha256 "00ef547cb2ddfd88659edb0bea7763b5f64030c1fc129c569846b861b6466dcb"
    end
  end

  def install
    bin.install Dir["levelrail-cli-*"].first => "levelrail-cli"
    chmod 0555, bin/"levelrail-cli"
    generate_completions_from_executable(bin/"levelrail-cli", "completion")
  end

  test do
    assert_match "deploy and run apps on your servers", shell_output("#{bin}/levelrail-cli help")
  end
end
