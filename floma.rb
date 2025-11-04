# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/v1.1.9/floma-macos-arm64-1.1.9"
      sha256 "1b94012278702c8fda0ce492efd8412124c36086e6ded5f9b6d2d8b751953fb5"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/v1.1.9/floma-macos-x86_64-1.1.9"
      sha256 "f2efef3e72ac9ca8f8e0b43d7d91d30c4e1c6ff4b0bd060448ffa67b6006484f"
    end
  end

  def install
    bin.install "floma-macos-arm64-1.1.9" => "floma" if Hardware::CPU.arm?
    bin.install "floma-macos-x86_64-1.1.9" => "floma" if Hardware::CPU.intel?
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
