class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.6/levelrail-cli-darwin-arm64"
      sha256 "9d8439ae2687ab9aa0c6c2a8b7928aba4bcece4eade3377c68dbe7e1738ff8f4"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.6/levelrail-cli-darwin-amd64"
      sha256 "5596a27e503adfef89066f80294fd764841f258e086f7c17a9a01b045b12462e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.6/levelrail-cli-linux-arm64"
      sha256 "6c69dd41cfc6e79765ad161f0d1fed7b3a9d1ab3778afb82965ca0f106fd85c2"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.6/levelrail-cli-linux-amd64"
      sha256 "6747306d5d84b83463afd199f82bc7f3f333756a9a7d5ac952210dede42c31c0"
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
