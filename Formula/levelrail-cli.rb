class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.0/levelrail-cli-darwin-arm64"
      sha256 "f5fec1af1199b406e7e8d5b123605b511f690fe2e97237ff9ab1237a21de787f"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.0/levelrail-cli-darwin-amd64"
      sha256 "906904dfc29288b2d74b63dbefc985ea2b6ebbed1575fc91a78f75628c457281"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.0/levelrail-cli-linux-arm64"
      sha256 "bbaad563c9b10a401aa5bf7e0609acf1632c50e3c88afbd3e222173b3b3cace2"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.0/levelrail-cli-linux-amd64"
      sha256 "bf46b00c50693fae3679d646a8a70dcf2ab39a78897cb502e5aac2367bae4d85"
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
