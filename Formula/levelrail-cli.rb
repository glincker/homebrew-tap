class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.1/levelrail-cli-darwin-arm64"
      sha256 "0b2de8c77e19d4bbd87a3192be65addfddb990b574f6f7682298a41b822b7758"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.1/levelrail-cli-darwin-amd64"
      sha256 "b6a2f6240f7748991953eabfc081f16b02cc3db47bf6de590a321d7af720002d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.1/levelrail-cli-linux-arm64"
      sha256 "32982622bf7335cf8ec15d7a3356cf9a049d872cfad76c12e13ec3676d3ee58b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.1/levelrail-cli-linux-amd64"
      sha256 "20e6135a4ce6a74c12f48925b292dd05748a9769727f769e5a692cf12faf33df"
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
