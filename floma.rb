# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-arm64"
      sha256 "e82e318604304395a3d77754a35275e33fec4af28af185484f3cb7a0838a5994"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-x86_64"
      sha256 "728889848baad581cc81b2e0f15bd4ce6f932e4d4febea12d0e56b9b81cbe0de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-arm64"
      sha256 "d7e273f7ff4c4ff47146aaa40f69e6f05dc852ff5db851e2916b6c75d872fa12"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-x86_64"
      sha256 "51c0036787027b02a38f76cad04f87a29a03ea5c72228a0bf347a08ab865c10d"
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
