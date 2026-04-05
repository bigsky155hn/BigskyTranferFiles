# Client Screen Guide

## Role

The **Client Screen** is used to connect to the server, browse published shares, download content to the local machine, upload content back to the server, and monitor transfer activity.

In a binary distribution workflow, this is the main day-to-day screen used by operators and end users.

## Connection Area

### Saved Server

- Stores up to `20` connection profiles
- Supports `Save Profile` and `Delete`
- Each profile can retain:
  - IP
  - Port
  - Username
  - Password
  - TLS mode
  - Timeout mode
  - Threads/File
  - Parallel Files
  - Conflict policies

This is especially useful when the same machine connects to multiple internal servers or test environments.

### Server IP / Port / Username / Password

- Used to connect to the target server
- For same-PC testing, `127.0.0.1` is recommended

### Threads/File

- Upper concurrency limit per file
- Default: `25`

### Parallel Files

- Upper concurrency limit for simultaneous files

### Download Conflict / Upload Conflict

Supported modes:

- `Resume`
- `Overwrite`
- `Rename`
- `Skip`

## TLS and Timeout

### Use TLS

- Enable only when the server is also using TLS
- If the client and server do not match, the app will instruct the operator to enable or disable TLS
- Default on app start: `OFF`

### Trust On First Use

- Stores the server certificate pin on the first successful TLS connection
- Later connections trust only that pinned certificate unless it is cleared

### Verify Checksum

- Enables post-transfer `SHA-256` verification
- Can be turned off to enter `Fast Mode`

### Custom Timeout

- Allows manual timeout values
- If custom timeout is not used, the app applies defaults:
  - LAN/local: `probe 3s`, `connect/login 8s`
  - WAN/VPN: `probe 5s`, `connect/login 15s`

These defaults are intended to balance responsiveness and stability across common internal deployment scenarios.

## Server Shares

### Purpose

- Displays all currently published server shares
- Supports browsing into subfolders
- Supports searching, filtering, and downloading selected items

### Breadcrumb

- `Remote root` is the top-level entry point for all server shares
- When already at the root level, it acts as a current-location indicator

### Search and Filter

- Search by name or path
- Filter by:
  - `All`
  - `Folders`
  - `Files`

### Actions

- `Download Selected`
- `Cancel Download`
- `Up`
- `Refresh`
- `Enter Folder`
- `Select All`
- `Clear`

Typical usage:

1. navigate to the required server folder
2. select one or more items
3. choose the local staging folder
4. start the download

## Local Staging Area

### Purpose

- Stores downloaded files locally
- Provides the upload source area for pushing local files to the server

### Search and Filter

- Search by name or path
- Filter by:
  - `All`
  - `Folders`
  - `Files`

### Actions

- `Choose Folder`
- `Open in Explorer`
- `Upload Selected`
- `Cancel Upload`
- `Up`
- `Refresh`
- `Select All`
- `Clear`
- `New Folder`
- `Rename`
- `Delete`

The local staging area is both:

- the destination for downloads
- the source for uploads

## Transfer Console

### Displayed information

- Overall progress
- Live speed
- Elapsed time
- Auto-tuning status
- Per-item transfer status

### Behavior

- Shows progress per item and for the batch
- Shows real-time elapsed time during active transfers
- Supports `Resume Pending` and `Clear Pending`

## Activity History

- Records connect, disconnect, download, upload, and local file actions
- Useful for troubleshooting and support

## Operational Recommendation

For the best user experience:

- use `127.0.0.1` for same-PC testing
- use `LAN IP` for local office environments
- only use `WAN IP` when Internet routing is intentionally configured
- keep `Verify Checksum` enabled for integrity-focused scenarios
- switch to `Fast Mode` only when throughput is more important than post-transfer verification

## Operational Notes

- For very large transfers, disabling `Verify Checksum` may improve throughput
- The local area refreshes automatically after completed downloads so new files appear immediately
