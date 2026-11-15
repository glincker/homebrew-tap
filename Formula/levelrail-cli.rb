class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.0/levelrail-cli-darwin-arm64"
      sha256 "04cb3225931a2510d88c4a5e1903fc036df1d8ceaaa14115d4648dd0b947899a"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.0/levelrail-cli-darwin-amd64"
      sha256 "8d56e0b37ffdd832fe9c31c75f3ab5db3de052390c06a52bc37a20abf239c147"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.0/levelrail-cli-linux-arm64"
      sha256 "e250def158f493d550d8515b24822814c242875843fd164e31c240671cfa1c7b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.0/levelrail-cli-linux-amd64"
      sha256 "16662781bf67f1436afdf178417f927236e5cb7b8c72cd0ceda387a42f21892d"
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
