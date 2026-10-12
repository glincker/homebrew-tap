class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.1/levelrail-cli-darwin-arm64"
      sha256 "9eb07efa10887d411518abf5e072f476a3ac759a725469b866f5c4adf081ec14"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.1/levelrail-cli-darwin-amd64"
      sha256 "5006d09e283e9d20832f4ec33ff61a887cbe51a8690c312fad3bd3d67a7e84fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.1/levelrail-cli-linux-arm64"
      sha256 "86ee91d992d0df9b0d5e88267df2ef2b21405873b642fcb286daf2ec1d13db58"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.1/levelrail-cli-linux-amd64"
      sha256 "c86a34a407bac3208405cb9c40d5fd7fea5e033f00348488fdea51cbf65bac9f"
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
