cask "barometer" do
  version "1.0.0"
  sha256 "18170a896730a121ef06d64f9e9d7b2f5a0bc07c2b2cd8bf1059ad8421e535f0"

  url "https://github.com/YasinSimsek99/barometer/releases/download/v1.0.0/Barometer-#{version}.zip"
  name "Barometer"
  desc "Private, local Claude Code usage monitor for the macOS menu bar"
  homepage "https://github.com/YasinSimsek99/barometer"

  depends_on macos: ">= :sonoma"

  app "Barometer.app"

  uninstall quit:   "io.github.yasinsimsek.barometer",
            script: {
              executable: "Barometer.app/Contents/MacOS/Barometer",
              args:       ["--prepare-uninstall"],
              sudo:       false,
            }

  zap trash: [
    "~/Library/Application Support/io.github.yasinsimsek.barometer",
    "~/Library/Caches/io.github.yasinsimsek.barometer",
    "~/Library/LaunchAgents/io.github.yasinsimsek.barometer.plist",
  ]
end
