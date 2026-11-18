class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.1/levelrail-cli-darwin-arm64"
      sha256 "2fd6df27b3b39597b989e798bce910209ebcb566ee912d78b4ad581ffc19ef38"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.1/levelrail-cli-darwin-amd64"
      sha256 "48cf99093527cc57e8df6d9d7da742e3f8d5dd992b89ccb2024570b65a726f8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.1/levelrail-cli-linux-arm64"
      sha256 "f8548bce47c5a5b737cd3450d01d1673fad0cdd06472398426e4469e681ee45c"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.1/levelrail-cli-linux-amd64"
      sha256 "21aa3b6cb2f6b2914afd9fd78ba64eab2a18b531650e8ea0c112be204527b7b7"
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
