# homebrew-remote-vibecode

Homebrew tap for [remote-vibecode](https://github.com/ibrahim/remote-vibecode) - Tmux Terminal Sharing Service.

## Installation

```bash
# Add the tap
brew tap ibrahimsn98/homebrew-remote-vibecode

# Install remote-vibecode
brew install remote-vibecode

# Start the service
brew services start remote-vibecode

# Check status
brew services list

# Stop the service
brew services stop remote-vibecode
```

## Usage

After installation, the web UI will be available at http://localhost:8080

Create a tmux session to share:
```bash
tmux new-session -s my-session
```

Then open http://localhost:8080 in your browser to view and interact with your tmux sessions.

## Configuration

Environment variables:
- `PORT`: Server port (default: 8080)
- `HOST`: Server host (default: 0.0.0.0)

To configure, edit the service plist:
```bash
brew services stop remote-vibecode
# Edit ~/Library/LaunchAgents/homebrew.mxcl.remote-vibecode.plist
brew services start remote-vibecode
```

## Development

To test formula changes:
```bash
brew install --build-from-source ./Formula/remote-vibecode.rb
```
