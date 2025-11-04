# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/1.1.4/floma-macos-arm64"
      sha256 "2833a3b79eee78671d48a5e03513ea8570ae79f064b468e784ba9c93541ca461"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/1.1.4/floma-macos-x86_64"
      sha256 "e460228cf67fdc973e1a3017142c306f6c78c8abe231d1f97419a13e676cd20d"
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
