cask "copilot" do
  version "3.2.0,108-567db547"
  sha256 "567db5472d4abb3388b4f5a90dc1da10ddd871282d10e47e9716859b31099f38"

  url "https://storage.googleapis.com/copilot-mac-releases/images/Copilot-#{version.csv.first}-#{version.csv.second}.dmg",
      verified: "storage.googleapis.com/copilot-mac-releases/"
  name "Copilot"
  desc "Track and budget money"
  homepage "https://copilot.money/"

  livecheck do
    url "https://releases.copilot.money/latest"
    regex(/copilot[._-](\d+(?:\.\d+)+)-(\d+)-(\w+)/i)
    strategy :header_match do |headers, regex|
      headers["location"].scan(regex).map { |match| "#{match[0]},#{match[1]}-#{match[2]}" }
    end
  end

  app "Copilot.app"

  zap trash: [
    "~/Library/Containers/com.copilot.production",
    "~/Library/Group Containers/group.com.copilot.production",
  ]
end
