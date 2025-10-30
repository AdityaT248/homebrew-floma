# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.2"

  # Pre-built binary, no compilation needed - skip Xcode/build tool checks
  bottle :unneeded

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-arm64"
      sha256 "b27a06c48fa25aab5de1881beb20871efd9d00cf0270b8bd830916f02e691171"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-x86_64"
      sha256 "3b16fa3a71db612d50962337bee55e594e6a68e95ba8fb9e13dd18dd46cc5e31"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-arm64"
      sha256 "43bdf4124d24adc5d1f68bc3c8f5e4aa6673d464950a70af1793a43e8264117c"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-x86_64"
      sha256 "964824f0fc206f104e2206deecb118b85756de37466498e54903e1e8e3ae947b"
    end
  end

  def install
    # Determine the binary name based on platform
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "floma-macos-arm64" : "floma-macos-x86_64"
    else
      binary_name = Hardware::CPU.arm? ? "floma-linux-arm64" : "floma-linux-x86_64"
    end

    bin.install binary_name => "floma"
  end

  test do
    system "#{bin}/floma", "--help"
  end

  def caveats
    <<~EOS
      🎉 Floma has been installed!

      Quick Start:
        floma new "Extract totals from PDFs in ~/receipts and save to Excel"
        floma list
        floma run <workflow_id>

      Documentation: https://getfloma.com/docs

      Note: Free tier includes 5 AI extractions/month
            Upgrade at https://getfloma.com for more features
    EOS
  end
end
