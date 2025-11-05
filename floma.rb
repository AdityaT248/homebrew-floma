# Homebrew Formula for floma
# To use this formula:
# 1. Create a tap: brew tap getfloma/floma
# 2. Install: brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "1.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-5a6b7cf38ae340a7943084f3b9ad4a42.r2.dev/v1.1.6/floma-1.1.6-macos-arm64"
      sha256 "3800544d2ec638397ab7daf3782992bd6a0334e86f7e2703005b62259b2e4900"
    else
      url "https://pub-5a6b7cf38ae340a7943084f3b9ad4a42.r2.dev/v1.1.6/floma-1.1.6-macos-x86_64"
      sha256 "7606cc7a37f15ceba49cf93571cd4e80b11d5bd9646b916ee43985e8419ff107"
    end
  end

  def install
    bin.install "floma-1.1.6-macos-arm64" => "floma" if Hardware::CPU.arm?
    bin.install "floma-1.1.6-macos-x86_64" => "floma" if Hardware::CPU.intel?
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
