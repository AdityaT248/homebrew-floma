# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/1.0.2/floma-macos-arm64"
      sha256 "2bf9a6f821f32e9a185dc1cb9220d40bdcc8ec3e9884dc776992cf638df8f32c"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/1.0.2/floma-macos-x86_64"
      sha256 "ecef805a967bd55f55773b5c809a63206e0fbab1480fea7133024f44a7b6af64"
    end
  end

  def install
    bin.install "floma-macos-arm64" => "floma" if Hardware::CPU.arm?
    bin.install "floma-macos-x86_64" => "floma" if Hardware::CPU.intel?
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
