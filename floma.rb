# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-arm64"
      sha256 "bbf4242d6122d46211dedfc00d9c5a8b93524c75f0382b043856dae89f8efc25"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-x86_64"
      sha256 "dcfba33a037e8e9ec4ece2997055f5d2bf856c21bfe52b85fab6c814b5de73bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-arm64"
      sha256 "c056539be7657c2d13afc3a0be95b416faab072490175b6ef1d6816ce393c323"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-x86_64"
      sha256 "24e8f20a12e06d16bfc128f1abc517d83cdb1c802b031d40c8c4d08939104376"
    end
  end

  # Pre-built binary - no compilation needed
  def install
    # Determine the binary name based on platform
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "floma-macos-arm64" : "floma-macos-x86_64"
    else
      binary_name = Hardware::CPU.arm? ? "floma-linux-arm64" : "floma-linux-x86_64"
    end

    bin.install binary_name => "floma"
  end

  def pour_bottle?
    false
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
