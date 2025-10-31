# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.10/floma-macos-arm64"
      sha256 "77e683afcf861dafa8f317592028b5da8345472ee74a245729ca0c16fe281eec"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.10/floma-macos-x86_64"
      sha256 "a3fdc4d30e5f940c493d4d377cacb8d9122c37af045bec95389d448487a9c47d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.10/floma-linux-arm64"
      sha256 "58275cbcaf637165c2d70f3b5ebbcdd4511dd5c21dec639b4037657040ab3543"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.10/floma-linux-x86_64"
      sha256 "cbf5ea838396a4ef2171a785adc55a9ad8ca9948690df8170392665aff495615"
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
