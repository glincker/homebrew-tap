class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.2/levelrail-cli-darwin-arm64"
      sha256 "37009ee22e54967fd0db6db96c64858c326c0b4643262ecd6fe9ce69e35d79de"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.2/levelrail-cli-darwin-amd64"
      sha256 "e10d907c8db5ccab1a97d126e6703f9e067742939a1d0a84e4c0d81db715a9be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.2/levelrail-cli-linux-arm64"
      sha256 "931c43dba80c76970f89a7049bb1b2c1cd4f32615d971c903aeeb5eb6f45c84e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.2/levelrail-cli-linux-amd64"
      sha256 "9e5d59d79f68b209a548fe07443d920aeaafb5453aeddf713a3698776a100629"
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
