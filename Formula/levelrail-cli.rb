class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.7.0/levelrail-cli-darwin-arm64"
      sha256 "c6c0e588ed41cd65600a61313c6ace570079dda18c2f049389563c54340692db"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.7.0/levelrail-cli-darwin-amd64"
      sha256 "2c467e707ef3a46cda911722a44f91282527105d82d5aa580bebc3e8458a9904"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.7.0/levelrail-cli-linux-arm64"
      sha256 "672c9a718f6e56ab802386eef2be7ea0ffdb7bde3864226fab9e1301db61f5fc"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.7.0/levelrail-cli-linux-amd64"
      sha256 "6d1c08ab256075c4d77c580c403b39086733a463848e96a6a45e1a3eb308a12a"
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
