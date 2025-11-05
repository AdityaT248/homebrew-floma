# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/v1.1.5/floma-macos-arm64"
      sha256 "ee03037900e274b36f08cc21b40b0333eb47163058e14283a6d04f169505c468"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/v1.1.5/floma-macos-x86_64"
      sha256 "510b78d1ea0404188caac67323f3120d1d62b80ed96da428f9a8a52269810c11"
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
