cask "wort" do
  version "1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/atadatcu/wort-builder/releases/download/v#{version}/Wort.dmg"
  name "Wort"
  desc "Local-first terminal (fork of Warp Lite / WarpOss)"
  homepage "https://gitlab.com/adatcu/wort"

  app "Wort.app"

  livecheck do
    url "https://github.com/atadatcu/wort-builder/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)*)}i)
  end

  caveats <<~EOS
    Wort may be unsigned. If macOS blocks it after install:

      xattr -cr /Applications/Wort.app
  EOS

  zap trash: [
    "~/Library/Application Support/dev.warp-lite.WarpLite",
    # add more paths if you change bundle id / app support dir
  ]
end
