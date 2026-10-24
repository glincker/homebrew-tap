class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.3/levelrail-cli-darwin-arm64"
      sha256 "070970ad1065c331b31381eb71230f0ddd43b96b5aa27cc53a6f0ebfbb03f0ec"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.3/levelrail-cli-darwin-amd64"
      sha256 "4d4fb61727a662de7d98d2af30488ad2299dba90b33ddc1e4ca57e549b78b66f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.3/levelrail-cli-linux-arm64"
      sha256 "c533d3345c3b51e5b77c01ef99b47bcc0ae377807dea953722f7c02aee332c6f"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.3/levelrail-cli-linux-amd64"
      sha256 "32c795dd865b6065bcc291b0630324d6c73b94515ab8fe8d60abe966d50d8be2"
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
