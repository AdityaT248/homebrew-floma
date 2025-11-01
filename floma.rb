# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.12/floma-macos-arm64"
      sha256 "5de37ba57855568fd7872feb495bba21ac9719c4b278a7540c2c05b5e133068f"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.12/floma-macos-x86_64"
      sha256 "50f8d664915dafb95ddc49398a1b0b1e33db1a681b0de108c91e185f0e3fbdcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.12/floma-linux-arm64"
      sha256 "057727b900072b58c4b1f4bd5a5bdee81005aa04d56d449b15134b160447710c"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.12/floma-linux-x86_64"
      sha256 "ed4ba2628f54c6ba7270a67c4787687f3391232c63a32bf834da900c2cf01a20"
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
