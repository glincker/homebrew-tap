class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.2.0/levelrail-cli-darwin-arm64"
      sha256 "56b665d0a19684823f1ded858c350b935d94241e4a63df8fa773d9aa4e92da9b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.2.0/levelrail-cli-darwin-amd64"
      sha256 "8d8dbb0d99ae0dd74ff3bbf4b1c1fd56a32ff7834793b47c954e79c9e9b6dee7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.2.0/levelrail-cli-linux-arm64"
      sha256 "3c291f7227d7c8ce19b630865e4cac0e6ab552044f1f533e89b6273e5b84504a"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.2.0/levelrail-cli-linux-amd64"
      sha256 "f0acbd7f5d896198ad9b18f55a82698f463752f46ce39c98b7741e25ad36b6f3"
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
