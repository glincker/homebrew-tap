class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.9.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.6/levelrail-cli-darwin-arm64"
      sha256 "252303def43fd7e3f96fa4e746b64988c410d11f7caa7db0a7d993a8d8b2b0ea"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.6/levelrail-cli-darwin-amd64"
      sha256 "d93d8a9390c46cb237114ee577ce8d7c0d885d7814959dc1447c81508c06c44a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.6/levelrail-cli-linux-arm64"
      sha256 "7efe5ff699739845bc5a54218bdb45187569f97a4afd3a7fab2fe92c7b1922fe"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.6/levelrail-cli-linux-amd64"
      sha256 "df564860137265ecd69a2c0e460041e464d07f546323d87cdd56935334a67842"
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
