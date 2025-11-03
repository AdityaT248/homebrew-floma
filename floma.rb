# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/1.0.0/floma-macos-arm64"
      sha256 "1bf2bbca17a8ade14fe2fca913dfba76b6955bdc140709c901282073279fa855"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/1.0.0/floma-macos-x86_64"
      sha256 "5948e35b176567e6da6b985ee666f11003c04dc0cd59e793034b043f2dccf59e"
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
