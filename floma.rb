# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.15/floma-macos-arm64"
      sha256 "cf516b5f563904e8006ffacf0e67df45213bfc6321a114dba17b5a160dc333bb"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.15/floma-macos-x86_64"
      sha256 "aa2b6cf5c0c3be02a291afe603d2785f450c2a4793926b8b3dcd7df0ccc9f4e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.15/floma-linux-arm64"
      sha256 "e3f1d3cc0ff0dd062006387851a166ff63cb604d420cfa9897e008af68c0e7ad"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.15/floma-linux-x86_64"
      sha256 "8efa48f3e7230d06e2642f15cc0153b0447a2663d0d8f42bef96623477600914"
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

      Updating Floma:
        brew update && brew upgrade floma

      Note: Free tier includes 5 AI extractions/month
            Upgrade at https://getfloma.com for more features
    EOS
  end
end
