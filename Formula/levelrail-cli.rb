class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.4/levelrail-cli-darwin-arm64"
      sha256 "38c3585404558d85687dedbfcc3c1196fcf8acaf43df75bd3dc4953cc84df4f7"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.4/levelrail-cli-darwin-amd64"
      sha256 "f184bc1ffaa7c3298ab344dadd278b36b0b95180871d6904480cbd415eb8085c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.4/levelrail-cli-linux-arm64"
      sha256 "0351830719c9ade970e5b26644c2d261aa55e8df43615e0d0467602fbd8bb661"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.4/levelrail-cli-linux-amd64"
      sha256 "16cc07d46df0e7c761a9023705ae1b90c30ae344ccee06d205e5b35ade786784"
    end
  end

  def install
    bin.install Dir["levelrail-cli-*"].first => "levelrail-cli"
    chmod 0555, bin/"levelrail-cli"
    generate_completions_from_executable(bin/"levelrail-cli", "completion")
  end

  test do
    assert_match "scriptable client", shell_output("#{bin}/levelrail-cli help")
  end
end
