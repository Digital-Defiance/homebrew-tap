cask "bsh-sdiagent" do
  version "1.0.0"
  sha256 "6ccf5e9936d78009bb747b5ab79fa8486a861cef2810ee356b0f5c2a5170ae01"

  url "https://github.com/Digital-Defiance/bsh-sdi-agent/releases/download/v1.0.0/BSH-SDIAgent-1.0.zip"
  name "BSH SDIAgent"
  desc "Secure Data Injection Agent for BrightShell"
  homepage "https://github.com/Digital-Defiance/bsh-sdi-agent"

  app "BSH SDIAgent.app"

  caveats do
    """
    After installation, you may need to grant accessibility permissions in System Preferences > Security & Privacy > Privacy > Accessibility for full functionality.
    """
  end
end
