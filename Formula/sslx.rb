class Sslx < Formula
  desc "The modern way to work with certificates and TLS"
  homepage "https://github.com/glincker/sslx"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/glincker/sslx/releases/download/v#{version}/sslx-macos-aarch64"
      sha256 "" # Will be updated after release builds
    else
      url "https://github.com/glincker/sslx/releases/download/v#{version}/sslx-macos-x86_64"
      sha256 "" # Will be updated after release builds
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/glincker/sslx/releases/download/v#{version}/sslx-linux-aarch64"
      sha256 "" # Will be updated after release builds
    else
      url "https://github.com/glincker/sslx/releases/download/v#{version}/sslx-linux-x86_64"
      sha256 "" # Will be updated after release builds
    end
  end

  def install
    bin.install Dir["sslx*"].first => "sslx"
  end

  test do
    assert_match "sslx", shell_output("#{bin}/sslx --version")
  end
end
