# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.13/floma-macos-arm64"
      sha256 "1adbf0a83f9f3275de57be917be461ae93970413cbf68d5663305b507f3bc31a"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.13/floma-macos-x86_64"
      sha256 "8e9695c2fc8f241c6552213dd5b82cca7bdbe10f442d67d9117c60ff5091e7b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.13/floma-linux-arm64"
      sha256 "a5cc4ae95122bbea5982abcfc9f92824b99b540879a3248e7dd5ac0726d48898"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.13/floma-linux-x86_64"
      sha256 "fa6a2995d0a1800b37d66b4e2f2fdf8273139b3e051153b849035c0b40e3a9bc"
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
