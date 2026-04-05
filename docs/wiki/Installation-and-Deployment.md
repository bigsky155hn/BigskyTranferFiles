# Installation and Deployment

## Purpose

This page explains how to install and deploy BigskyTranferFiles on a new machine in a stable and operator-friendly way.

The focus here is **binary deployment**, not source-based development.

## System Requirements

- Windows 10 or Windows 11 `x64`
- `.NET Desktop Runtime 9.0 x64` for the framework-dependent build
- Firewall permission to open inbound TCP on the server machine

## Release Artifacts

### Main publish output

- `publish/BigskyTranferFiles`

Important files:

- `BigskyTranferFiles.exe`
- `BigskyTranferFiles.dll`
- `BigskyTranferFiles.Client.dll`
- `BigskyTranferFiles.Server.dll`
- `BigskyTranferFiles.Shared.dll`
- `BigskyTranferFiles.deps.json`
- `BigskyTranferFiles.runtimeconfig.json`

`.pdb` files are optional and are not required at runtime.

### Installer output

- `publish/installer/BigskyTranferFiles-Setup-<version>.exe`
- `publish/installer/BigskyTranferFiles.update.json`

## Preferred Release Artifacts

For normal deployment, the following outputs are enough:

- `publish/BigskyTranferFiles`
- `publish/installer/BigskyTranferFiles-Setup-<version>.exe`
- `publish/installer/BigskyTranferFiles.update.json`

## Local Launch

If the published package is already present in the repository, launch:

```cmd
run-app.cmd
```

This command starts:

- `publish/BigskyTranferFiles/BigskyTranferFiles.exe`

## Deployment to a New Machine

### Option 1: Use the installer

Recommended for internal rollout.

1. Copy `BigskyTranferFiles-Setup-<version>.exe`
2. Run the installer
3. Complete the setup wizard
4. Launch the app from the created shortcut or Start Menu entry

### Option 2: Use the publish folder

1. Copy the entire `publish/BigskyTranferFiles` folder
2. Install `.NET Desktop Runtime 9.0 x64` if the target machine does not already have it
3. Run `BigskyTranferFiles.exe`

This option is useful when:

- you do not want to use an installer
- you distribute the app through a controlled internal file share
- you want to keep deployment lightweight

## Network Setup

### When the machine acts as the server

- Default port: `1505`
- Open inbound TCP `1505` in Windows Firewall
- If Internet access is needed, configure router or firewall port forwarding

### When the machine acts as the client

- Same-PC testing: `127.0.0.1`
- Same LAN: use the server's `LAN IP`
- WAN/VPN: use `WAN IP` or the appropriate private VPN address

## Post-Installation Checklist

- The app launches successfully
- `Server Screen` can start the server
- `Client Screen` can connect successfully
- Download test succeeds
- Upload test succeeds
- History records events correctly
- Update feed can be checked if configured

## GitHub Release Deployment

### Requirements

- The GitHub repository must contain at least one commit
- The Personal Access Token must have:
  - `Contents: Read and write`
  - `Metadata: Read-only`

### Release contents

Each GitHub Release should contain:

- `BigskyTranferFiles-Setup-<version>.exe`
- `BigskyTranferFiles.update.json`

This makes GitHub Releases suitable as a lightweight internal distribution channel, even when the repository mainly ships binaries rather than source code.

## Operational Notes

- If `Start Server` fails with `Only one usage of each socket address...`, the selected port is already in use.
- If `WAN IP` does not work from the same router, the network likely does not support `NAT loopback/hairpin`.
