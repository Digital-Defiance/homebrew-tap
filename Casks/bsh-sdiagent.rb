cask "bsh-sdiagent" do
  version "1.0.2"
  sha256 "2b9a8581b558a01fd362614caed2321f750e536cfcce2c0c66e90ca0805174c0"

  url "https://github.com/Digital-Defiance/bsh-sdi-agent/releases/download/v1.0.2/BSH-SDIAgent-1.0.2.zip"
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
