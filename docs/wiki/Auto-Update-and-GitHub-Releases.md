# Auto Update and GitHub Releases

## Purpose

BigskyTranferFiles includes an internal update flow to reduce manual rollout effort when distributing new versions across multiple Windows machines.

This update model is especially useful when the repository is used primarily as a **binary release repository** rather than a source-code collaboration repository.

## Supported Update Feed Types

- Local folder
- UNC or network share
- Direct manifest URL
- GitHub repository URL
- GitHub Releases manifest URL

## Update Bar Components

### Current

- Shows the version currently running on the machine

### Update feed text field

- Stores the update channel location
- Accepted values include:
  - local folder path
  - network share path
  - direct manifest URL
  - GitHub repository URL

### Auto Check

- When enabled, the app automatically checks for updates when `Server Screen` opens

### Choose

- Opens a folder picker for local or network-share update feeds
- Not used for GitHub URLs

### Check Now

- Performs an immediate update check

### Install Update

- Becomes meaningful when a newer version is found
- Downloads the new `Setup.exe` locally and launches the installer

### Clear

- Clears the stored update feed

### Latest internal build

- Displays the latest version discovered in the configured update channel

## GitHub Update Feed

### Repository URL

The app supports:

```text
https://github.com/<owner>/<repo>
```

When that format is entered, the app resolves it to:

```text
https://github.com/<owner>/<repo>/releases/latest/download/BigskyTranferFiles.update.json
```

### Direct manifest URL

The app also supports:

```text
https://github.com/<owner>/<repo>/releases/latest/download/BigskyTranferFiles.update.json
```

## Required Release Assets

- `BigskyTranferFiles-Setup-<version>.exe`
- `BigskyTranferFiles.update.json`

The manifest must point to the correct installer asset for that release.

These two files are the core release deliverables for update consumption.

## GitHub Publishing Flow

### Release package requirements

Each release should publish:

- `BigskyTranferFiles-Setup-<version>.exe`
- `BigskyTranferFiles.update.json`

The manifest should point to the correct installer asset in the same release.

After that, the desktop application can use the GitHub release as its update feed without requiring a shared local folder.

## GitHub Requirements

- The repository must contain at least one commit
- The token must have:
  - `Contents: Read and write`
  - `Metadata: Read-only`

## Common Errors

### `Repository is empty`

The repository has no commits yet. Push at least one commit before creating releases.

### `Resource not accessible by personal access token`

The token does not have sufficient permissions. Verify that `Contents: Read and write` is enabled.

## Recommended Release Practice

For clean internal rollout:

1. prepare the installer
2. prepare the update manifest
3. publish a GitHub Release
4. upload `Setup.exe` and `BigskyTranferFiles.update.json`
5. point clients to the repository URL or the direct manifest URL
