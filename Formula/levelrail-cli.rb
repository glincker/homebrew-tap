class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.3.0/levelrail-cli-darwin-arm64"
      sha256 "1f180404851481dd4cf26d9a934493f81e28031681309a1fa2a09f26a639d6be"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.3.0/levelrail-cli-darwin-amd64"
      sha256 "5b2e07c5c5a6e31dc2c9e34120e345c7e32211a37178c4e5a4e7fc2512277fa7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.3.0/levelrail-cli-linux-arm64"
      sha256 "0b1bc92e4d2066174d103e03451b2bbb4407bc77568a8d80096dd8689e3ec89d"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.3.0/levelrail-cli-linux-amd64"
      sha256 "64f9f279817583e33a824df774878d80af0ba4111fff8358bc977c24e94bda6e"
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
