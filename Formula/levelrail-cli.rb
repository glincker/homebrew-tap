class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.6/levelrail-cli-darwin-arm64"
      sha256 "6581ce7bf7b23d590656596ceda337a78e94626f08ec5ae6a9a1c8bd8b65ca32"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.6/levelrail-cli-darwin-amd64"
      sha256 "10bb46d2204ddeab2dbca4c0220cd5c268699eef5467ccbf874909863e54b89f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.6/levelrail-cli-linux-arm64"
      sha256 "1ff71a378a594a6483a0b65c17eb612b9148a16f4e78948d7d0a9d1e4bcd5948"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.6/levelrail-cli-linux-amd64"
      sha256 "2ecf89dd2728e3f1ffcd0b5c0001f298fb5e82752129e61fec885b8b8eeddf44"
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
