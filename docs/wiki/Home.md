# BigskyTranferFiles Wiki

## Overview

BigskyTranferFiles is a Windows desktop application that combines **Server Screen** and **Client Screen** in one executable. It is designed for fast internal file sharing and transfer across **same-PC**, **LAN**, **WAN**, and **VPN** scenarios, with support for resumable transfers, client control, optional TLS, and internal software updates.

This wiki is written for operators and end users working with the **published application package** and **installer artifacts**. It does not assume access to the source code.

## Core Principles

- One application for both server and client workflows
- High-throughput multi-threaded transfer
- Resume support after interruption or unexpected closure
- Practical Windows-first deployment
- Clear operational controls for internal teams

## Key Capabilities

- Share multiple files and folders at the same time
- Optional `Share all drives to the client`
- Parallel download and upload
- Resume transfers after network loss or restart
- Conflict policies: `Resume`, `Overwrite`, `Rename`, `Skip`
- Optional checksum verification or `Fast Mode`
- Search, filter, and breadcrumb navigation for large folder trees
- Client control through `Kill Client`, `Block IP`, and `Unblock IP`
- Optional TLS with certificate pinning via `Trust On First Use`
- Internal update support through local feeds or GitHub Releases

## Distribution Model

BigskyTranferFiles can be distributed as:

- a published application folder
- a Windows installer
- a GitHub Release containing the installer and update manifest

In most internal environments, the recommended rollout model is:

1. build the release package
2. publish `Setup.exe`
3. install on target machines
4. use the built-in update flow for future versions

## Standard Operating Flow

1. Launch `BigskyTranferFiles.exe`
2. Open **Server Screen**
3. Configure credentials if needed
4. Add shared folders/files or enable `Share all drives to the client`
5. Click `Start Server`
6. Switch to **Client Screen**
7. Connect using `127.0.0.1`, `LAN IP`, or `WAN IP` depending on the environment
8. Browse, download, and upload as needed

## Environment Guidance

- Same-PC testing: use `127.0.0.1`
- Same LAN: use the server's `LAN IP`
- Internet access: use the server's `WAN IP` only when routing and firewall rules are correct

## Default Values

- Server port: `1505`
- Default username: `admin`
- TLS: `OFF`
- Share all drives: `OFF`
- Server `Max Threads Per Item`: `50`
- Client `Threads/File`: `25`

## Wiki Contents

- [Installation and Deployment](Installation-and-Deployment)
- [Server Screen Guide](Server-Screen-Guide)
- [Client Screen Guide](Client-Screen-Guide)
- [Auto Update and GitHub Releases](Auto-Update-and-GitHub-Releases)
- [Architecture and Security](Architecture-and-Security)
- [Troubleshooting](Troubleshooting)
