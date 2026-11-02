class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.0/levelrail-cli-darwin-arm64"
      sha256 "fe4601480c2f54c60ad459fec58c70ecdd6108eb26d99e8d5a4975d48a4d2761"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.0/levelrail-cli-darwin-amd64"
      sha256 "6e6063f0cdf527f102280d82fb1bf269c4d8bc27db22ee35892be6834bd2e156"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.0/levelrail-cli-linux-arm64"
      sha256 "ae655adf3afd95fe4cee7e99d2af851182eedfe761929d1f1d74bbbc5e6e60f5"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.0/levelrail-cli-linux-amd64"
      sha256 "1582dceaeb102b3c1b43a791ee2ee50899b59d70ff50d07893b9b52b0df0b5d7"
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
