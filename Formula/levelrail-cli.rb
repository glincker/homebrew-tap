class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.3/levelrail-cli-darwin-arm64"
      sha256 "be250721916e388ff5ef1996c31935d9d3528c8973ccd6d4f2c1bb362a9fb027"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.3/levelrail-cli-darwin-amd64"
      sha256 "5981282d073d9015a9fde2500289b4749a264486f6b90a850f43a3e36d3dd4ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.3/levelrail-cli-linux-arm64"
      sha256 "95f9667060581a7314a33000c828986f60bfd311165ab93484efae07012c686d"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.3/levelrail-cli-linux-amd64"
      sha256 "0d43180e27ec0ad019a5daa5f719028a7a1fb986f295392c5ecfd6dae8b045d1"
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
