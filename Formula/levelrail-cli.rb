class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.9/levelrail-cli-darwin-arm64"
      sha256 "9d6752b11b847cec3739d63953f9060a829291ab3b9afffcbbcccb110f2153d2"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.9/levelrail-cli-darwin-amd64"
      sha256 "97449fc3689463336255b8040c6f4e82b3d0f015b4c48b7411518eb289b18066"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.9/levelrail-cli-linux-arm64"
      sha256 "905d5ecccc7c3416c28c439953ce9c556afb628bdee0f81322859bc4f4506708"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.9/levelrail-cli-linux-amd64"
      sha256 "a1286950afe7ceac1d3bfe7a0a234a0889df6e9db5daeec18d3a1b8fd2af7b16"
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
