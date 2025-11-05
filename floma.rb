# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/v1.1.8/floma-macos-arm64-1.1.8"
      sha256 "d2657cb8eb8cb78bcb4f6d7b3232ea8bc4d280acd0e5dea6daf2b0428bc27af9"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/v1.1.8/floma-macos-x86_64-1.1.8"
      sha256 "c493565f8e26ebc6906a9d2cf8ab7502958d34fc6e0e71cbaa27ac223fdb7c22"
    end
  end

  def install
    bin.install "floma-macos-arm64-1.1.8" => "floma" if Hardware::CPU.arm?
    bin.install "floma-macos-x86_64-1.1.8" => "floma" if Hardware::CPU.intel?
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
