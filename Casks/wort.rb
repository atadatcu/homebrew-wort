cask "wort" do
  version "51"
  sha256 "b8625dda773e7c9be93a57da782e406fcc94e29de94ca8af0b95b7cbe8dfe09d"

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
    If macOS blocks the app (unsigned/unnotarized):
      xattr -cr /Applications/Wort.app
  EOS

  zap trash: [
    "~/Library/Application Support/dev.warp-lite.WarpLite",
  ]
end
