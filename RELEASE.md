# Creating a Release

## 1. Create and push a tag

```bash
cd /Users/ibrahimsn98/Lab/claude-plugin
git tag v1.0.0
git push origin v1.0.0
```

## 2. Create GitHub Release

Go to: https://github.com/ibrahim/remote-vibecode/releases/new
- Tag: v1.0.0
- Title: v1.0.0
- Description: Initial release of remote-vibecode

## 3. Calculate SHA256

After creating the release, download the tarball and calculate SHA256:

```bash
# Download the release tarball
curl -L -o v1.0.0.tar.gz https://github.com/ibrahim/remote-vibecode/archive/refs/tags/v1.0.0.tar.gz

# Calculate SHA256
shasum -a 256 v1.0.0.tar.gz
```

## 4. Update Formula

Replace `SHA256_PLACEHOLDER` in `Formula/remote-vibecode.rb` with the actual SHA256.

## 5. Commit and push tap changes

```bash
cd /Users/ibrahimsn98/Lab/homebrew-remote-vibecode
git add Formula/remote-vibecode.rb
git commit -m "Update remote-vibecode to v1.0.0"
git push origin main
```

## 6. Test Installation

```bash
brew tap ibrahimsn98/homebrew-remote-vibecode
brew install remote-vibecode
brew services start remote-vibecode
```

Then open http://localhost:8080
