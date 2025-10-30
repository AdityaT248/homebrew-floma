# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap <your-username>/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.0"

  # Download URL for macOS ARM64 binary
  url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-arm64"

  # SHA256 checksum
  sha256 "22b3ef6418737883192b17162a2c89d454b906c284acfa403f071974f7e8fc22"

  # For macOS ARM64 (Apple Silicon)
  def install
    bin.install "floma-macos-arm64" => "floma"
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
