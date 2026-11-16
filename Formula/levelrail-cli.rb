class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.2/levelrail-cli-darwin-arm64"
      sha256 "2f71c52ba8e575c2e59898078b80e506e3645bf064413ab223194b6ba188f5fe"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.2/levelrail-cli-darwin-amd64"
      sha256 "995adc8224eb011571b839c4d78f9a39e704f5bb63e1e0066096a8b7558516b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.2/levelrail-cli-linux-arm64"
      sha256 "fe643af2470f90263e1d86ba038053118599def84948bfb6cfd58e795becdfa5"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.2/levelrail-cli-linux-amd64"
      sha256 "db6c160684186009ae219d9a6c1803b8e620025dfc8b2d0e7b8169b8be2295bb"
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
