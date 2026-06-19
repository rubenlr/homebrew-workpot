cask "workpot" do
  version "0.0.4"
  sha256 "d32cd4fa3212563f29d2e5410d6bc42e40053022700fd8db8620160758a64ad1"

  url "https://github.com/rubenlr/workpot/releases/download/v#{version}/Workpot-#{version}-aarch64.tar.gz"
  name "Workpot"
  desc "macOS git workspace finder — fast repo switching and Cursor launch"
  homepage "https://github.com/rubenlr/workpot"

  depends_on macos: :monterey

  app "Workpot.app"

  # Symlink the CLI binary onto PATH.
  # workpot-tray is the Tauri main executable (GUI); workpot is the CLI, injected by CI.
  binary "#{appdir}/Workpot.app/Contents/MacOS/workpot"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Workpot.app"]
  end

  zap trash: [
    "~/Library/Application Support/workpot",
    "~/.config/workpot",
  ]
end
