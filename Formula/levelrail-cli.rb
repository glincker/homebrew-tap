class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.2/levelrail-cli-darwin-arm64"
      sha256 "e8b090192818198569b9e84fec90a2756a277a8808b5b9a65c300ee82de54462"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.2/levelrail-cli-darwin-amd64"
      sha256 "d08788628f99b39f67728951f2b110b4e3ae1bf3edadb60a689d683c51939488"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.2/levelrail-cli-linux-arm64"
      sha256 "dc48388162c8d46e55221229f4d658b89a4a3f6be971bcff65499943b0a4a44f"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.2/levelrail-cli-linux-amd64"
      sha256 "5dac58c30b848f0f87be7abbecdfb4673dd7d126e9d3d291096284dfa6130429"
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
