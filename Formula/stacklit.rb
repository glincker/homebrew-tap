class Stacklit < Formula
  desc "Token-efficient codebase index for AI coding agents"
  homepage "https://github.com/glincker/stacklit"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/glincker/stacklit/releases/download/v0.4.0/stacklit_0.4.0_darwin_arm64.tar.gz"
      sha256 "7284a21cdd03647337e278dfaad0bb391dbdc46fca040bf9dc8b062e8aa492ae"
    end
    on_intel do
      url "https://github.com/glincker/stacklit/releases/download/v0.4.0/stacklit_0.4.0_darwin_amd64.tar.gz"
      sha256 "eb57e4a955ab1d73a382591cfdd98ad09f495bbe57844e718e04bb98a0aae2e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/stacklit/releases/download/v0.4.0/stacklit_0.4.0_linux_arm64.tar.gz"
      sha256 "50596a3d4f3ab71ce5ca928997d65ce7bad30c63919ec15e3943d0c8ccd393bc"
    end
    on_intel do
      url "https://github.com/glincker/stacklit/releases/download/v0.4.0/stacklit_0.4.0_linux_amd64.tar.gz"
      sha256 "4d78b4f442396ec83355fec60668592669c1850f4bdd96eb50f219f290e4f10c"
    end
  end

  def install
    bin.install "stacklit"
  end

  test do
    assert_match "token-efficient codebase index", shell_output("#{bin}/stacklit --help")
  end
end
