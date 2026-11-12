class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.1/levelrail-cli-darwin-arm64"
      sha256 "438151a76f9c310093469c1d92e22697f984d30c47fcce8d4b192ef5c6deadb9"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.1/levelrail-cli-darwin-amd64"
      sha256 "f764d91c5b0cf0413e47e019b23508f0b95ff44e37d69b63f063a1245b463351"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.1/levelrail-cli-linux-arm64"
      sha256 "fe0f840764bd47d9a3b62ca8194a64911a6c16de83a2db8964deef1378ed31f8"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.1/levelrail-cli-linux-amd64"
      sha256 "ec639bfdf89f4d9482e6c18af1801cb21cf76331a6e0db1f860631ee5d91c387"
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
