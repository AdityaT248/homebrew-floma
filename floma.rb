# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.16/floma-macos-arm64"
      sha256 "8a146ef6fa656b4763bc72aa1294280895ce1fae293b08cbe8d1d1accec8e63b"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.16/floma-macos-x86_64"
      sha256 "459d02828e763b6a9fe7bfd044ba6eaf2f2a6096de4285234abef42dc909457a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.16/floma-linux-arm64"
      sha256 "e071a9fd8007d26322d31f542ecc1754e1de7ba0a5c5eaee963c0bf8cb772336"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.16/floma-linux-x86_64"
      sha256 "3e88d1aab199c2b992ffec24ba280e3fa5d674885f5546d6dd35dfab14bc29c0"
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
