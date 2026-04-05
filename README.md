# BigskyTranferFiles

BigskyTranferFiles is a Windows desktop application for high-speed file sharing and transfer. It combines a **Server Screen** and a **Client Screen** in one application so operators can publish shared content, connect to remote shares, download, upload, resume interrupted transfers, and manage internal file exchange from a single tool.

This repository is intended as a **binary distribution repository**. It is designed for end users and internal operators who need the executable package, installer, and update artifacts. It does **not** need to expose the full source tree in order to be useful for deployment.

## Download

If you are an end user, start here:

- [Latest release page](https://github.com/bigsky155hn/BigskyTranferFiles/releases/latest)
- [Latest installer](https://github.com/bigsky155hn/BigskyTranferFiles/releases/latest/download/BigskyTranferFiles-Setup-latest.exe)
- [Latest update manifest](https://github.com/bigsky155hn/BigskyTranferFiles/releases/latest/download/BigskyTranferFiles.update.json)

If you are browsing the repository in GitHub:

- the **Code** tab explains the product and provides documentation
- the **Releases** tab contains the installer and update assets

## What This Repository Contains

The repository is expected to publish release-ready artifacts such as:

- `publish/BigskyTranferFiles`
- `publish/BigskyTranferFiles/BigskyTranferFiles.exe`
- `publish/installer/BigskyTranferFiles-Setup-<version>.exe`
- `publish/installer/BigskyTranferFiles.update.json`

In short:

- `publish/BigskyTranferFiles` is the runnable desktop package
- `publish/installer` contains the installer and update manifest

## Product Highlights

- Unified Windows desktop app with both **Server** and **Client** workflows
- Multi-threaded download and upload
- Resume support after interruption or unexpected closure
- Optional full-drive publishing through `Share all drives to the client`
- Search, filter, and breadcrumb navigation for large folder trees
- Conflict policies for existing files: `Resume`, `Overwrite`, `Rename`, `Skip`
- Optional `SHA-256` checksum verification or `Fast Mode`
- Client management with `Kill Client`, `Block IP`, and `Unblock IP`
- Optional TLS with `Trust On First Use`
- Internal software update flow through local folders, network shares, direct manifests, or GitHub Releases

## Screens and Responsibilities

### Server Screen

The **Server Screen** is used to:

- publish folders and files
- optionally publish all local drives
- configure `Username`, `Password`, and `Port`
- start and stop the server
- view active clients
- block or unblock IP addresses
- review operational history

### Client Screen

The **Client Screen** is used to:

- connect to the server
- browse shared folders
- download from server to local staging
- upload from local staging back to the server
- monitor live speed, progress, elapsed time, and transfer state
- save and reuse connection profiles

## Default Configuration

- Default server port: `1505`
- Default username: `admin`
- TLS default: `OFF`
- `Share all drives` default: `OFF`
- Server `Max Threads Per Item`: `50`
- Client `Threads/File`: `25`

## Recommended Connection Usage

### Same-PC testing

Use:

```text
127.0.0.1
```

### Same local network

Use the server's `LAN IP`.

### External access

Use the server's `WAN IP` only when:

- firewall rules are open
- router port forwarding is configured
- the network path is valid

## Installation

### Recommended option: use the installer

Run:

```text
publish/installer/BigskyTranferFiles-Setup-<version>.exe
```

This is the preferred rollout method for internal Windows environments.

### Alternative option: run the published app directly

If you distribute the app without the installer, launch:

```text
publish/BigskyTranferFiles/BigskyTranferFiles.exe
```

## Runtime Requirements

- Windows 10 or Windows 11 `x64`
- `.NET Desktop Runtime 9.0 x64` if you are using the framework-dependent package

If you distribute a self-contained build instead, the extra runtime is not required.

## Quick Start

### Start the server

1. Open `BigskyTranferFiles.exe`
2. Go to **Server Screen**
3. Add shared folders/files, or enable `Share all drives to the client`
4. Click `Start Server`

### Connect from the client

1. Switch to **Client Screen**
2. Enter the server IP, port, username, and password
3. Click `Connect`

### Download content

1. Browse `Server Shares`
2. Select files or folders
3. Choose the local staging folder
4. Click `Download Selected`

### Upload content

1. Select the target folder on the server side
2. Choose files or folders from the local staging area
3. Click `Upload Selected`

## Software Update

BigskyTranferFiles checks for updates through GitHub Releases.

### GitHub examples

Release page:

```text
https://github.com/<owner>/<repo>/releases/latest
```

Manifest URL:

```text
https://github.com/<owner>/<repo>/releases/latest/download/BigskyTranferFiles.update.json
```

Installer URL:

```text
https://github.com/<owner>/<repo>/releases/latest/download/BigskyTranferFiles-Setup-latest.exe
```

The application reads the manifest, detects a newer release, downloads the installer, and launches the update flow from the desktop app.

## Package Notes

- `.pdb` files are optional and are not required for runtime use
- If the package is shipped manually, keep the executable and its companion `.dll`, `.deps.json`, and `.runtimeconfig.json` files together
- If `Start Server` fails with `Only one usage of each socket address...`, the configured port is already in use
- If `WAN IP` does not work from the same router, the network may not support `NAT loopback/hairpin`
- If TLS settings do not match between client and server, the application will guide the operator to enable or disable TLS accordingly

## Intended Usage

BigskyTranferFiles is best suited for:

- internal company file distribution
- local office transfer workflows
- admin-to-user delivery of large files
- controlled Windows environments where an operator-friendly desktop tool is preferred over a browser-based file portal

## Documentation

Additional user and operational documentation can be published through the GitHub Wiki, including:

- installation and deployment
- server usage
- client usage
- internal update and GitHub Releases
- troubleshooting
- architecture and security

Repository maintenance guidance:

- `docs/Release-Repository-Policy.en.md`
- `docs/Release-Notes-Template.en.md`

## Repository Positioning

This repository is intended to be clean and practical for end users.

That means:

- executable files and installer artifacts can be the primary deliverables
- the GitHub landing page should explain installation and usage clearly
- source code exposure is optional, depending on your release strategy
