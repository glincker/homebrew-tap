class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.3/levelrail-cli-darwin-arm64"
      sha256 "acc0ae2929af9f1b65d6013883282f1667ee62d76b6007a65ea1e9a29b0f1bae"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.3/levelrail-cli-darwin-amd64"
      sha256 "a66030414844251e85bb088c7d0362340fff4aa38a9095fda00370fa301945d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.3/levelrail-cli-linux-arm64"
      sha256 "1c35eac281d7671336ca47d83c977c7d397e29d709ed7422afdca567e61f52fc"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.3/levelrail-cli-linux-amd64"
      sha256 "57553a756197642be2a8689ea5d7adc1f51f3fb451b38385e4dd306b640d5bc9"
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
