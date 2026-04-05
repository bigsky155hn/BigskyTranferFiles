# Server Screen Guide

## Role

The **Server Screen** is used to publish content, configure server-side access, and manage active client sessions.

It is responsible for:

- publishing folders and files
- managing credentials
- controlling server startup and shutdown
- enforcing network and login rules
- monitoring clients, blocked IPs, and history

In a binary deployment workflow, this screen is the operational entry point for the machine that acts as the file-sharing host.

## Network and Security

### LAN IP

- Displays the internal IP address of the server machine
- Used by clients on the same network
- Includes a `Copy` action

### WAN IP

- Displays the current public IP address
- Used by clients outside the local network when routing is configured correctly
- Includes a `Copy` action
- `Refresh WAN IP` updates the value

Note:

- WAN access requires proper firewall and router configuration
- using `WAN IP` from the same router may fail when the network does not support `NAT loopback/hairpin`

### Username / Password

- Default username is `admin`
- Password is persisted between launches
- A new password is generated only when `Generate New Password` is clicked
- Both fields include `Copy` actions

## Transport Security

The TLS area is grouped in a toggle to keep the layout compact.

### Enable TLS

- Turns encrypted transport on or off between client and server
- Default state is `OFF`

### TLS Certificate Thumbprint

- Displays the current server certificate thumbprint
- Used for trust validation and `Trust On First Use`

### Regenerate TLS Certificate

- Creates a new self-signed certificate
- Clients that pinned the old certificate may need `Clear TLS Pin`

## Advanced Settings

This group is also placed inside a toggle.

### Port

- Listening port for the server
- Default: `1505`

### Max Threads Per Item

- Upper limit for server-side work per file or folder
- Default: `50`

### Max Concurrent Connections

- Maximum total simultaneous connections allowed by the server
- Used by the client to size transfer concurrency

### Max Failed Login Attempts

- Number of failed logins allowed before temporary lockout

### Temporary Lockout Minutes

- Duration of the lockout window for offending IPs

## Shared Sources

### Purpose

- Add folders and files to publish
- Remove shares that are no longer needed
- Search and filter large share lists

### Share all drives to the client

- When enabled, the server publishes all available local drives
- When disabled, only manually added shares are visible
- Default on app start: `OFF`

Recommended usage:

- keep it `OFF` in controlled environments where only selected folders should be exposed
- enable it only when the machine is intended to act as a broad-access file host

### Search and Filter

- Search by `Name`, `Path`, and `Type`
- Filter by:
  - `All`
  - `Folders`
  - `Files`

## Connected Clients

### Displayed information

- Client name
- IP address
- Connected time
- Last seen
- Last action

### Actions

- `Kill Client`
- `Block IP`

### Search and Filter

- Search by client name, username, IP, or last action
- Filter by:
  - `All`
  - `Localhost`
  - `Network`

## Blocked IPs

- Shows all currently blocked addresses
- Allows selecting an IP and clicking `Unblock IP`
- Once unblocked, the client can reconnect if credentials are valid

## History

- Records server-side and client-side actions
- Useful for auditing startup, shutdown, transfer, block, unblock, and access events

## Operational Recommendation

For routine internal usage:

1. confirm `Username`, `Password`, and `Port`
2. add only the required shares
3. keep TLS aligned with the client configuration
4. start the server only after the machine is ready to accept connections

## Start and Stop Server

### Start Server

- Starts the listener on the configured port
- If it fails with `Only one usage of each socket address...`, the port is already in use

### Stop Server

- Stops the listener
- Connected clients are notified that the server is no longer available
