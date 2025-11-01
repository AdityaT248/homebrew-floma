# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.14/floma-macos-arm64"
      sha256 "3d958e08555465e145bbd9f5d9954dd70377a5fb91892111e575a0a0111d50b8"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.14/floma-macos-x86_64"
      sha256 "a6d926e9ecb7c190caeda6ccec4f01dd2733f2b039f0a111d9d0ef6b8d7ea3ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.14/floma-linux-arm64"
      sha256 "5a0884216a96d63800f78f1356038f029a3634aa9f2d18223a33140a47e7d12a"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.14/floma-linux-x86_64"
      sha256 "2db91ca6f6b8e8434562443703a593404d0ff95a706f573b24033aa095077609"
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
