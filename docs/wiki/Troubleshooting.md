# Troubleshooting

## Start Server fails because the port is already in use

### Symptom

- `Start failed: Only one usage of each socket address...`

### Fix

- Check whether port `1505` is already used by another application
- Close older BigskyTranferFiles instances
- Or change the port and start again

## Client cannot connect

### Basic checks

- Is the IP correct?
- Is the port correct?
- Are username and password correct?
- Has the server already been started?

### Environment checks

- Same-PC: use `127.0.0.1`
- LAN: use `LAN IP`
- WAN: verify firewall, port-forwarding, and routing

Also verify:

- the server is actually running
- TLS settings match on both sides
- the client IP has not been blocked

## TLS mismatch between client and server

### Case 1

- Server is not using TLS
- Client has `Use TLS` enabled

### Fix

- Disable `Use TLS`
- Click `Connect` again

### Case 2

- Server is using TLS
- Client has `Use TLS` disabled

### Fix

- Enable `Use TLS`
- Click `Connect` again

## WAN IP does not work from the same router

### Typical cause

- The router does not support `NAT loopback/hairpin`

### Correct usage

- Same-PC: `127.0.0.1`
- Same LAN: `LAN IP`
- External Internet: `WAN IP`

## Client was blocked and cannot reconnect

### Fix

- Open `Server Screen`
- Locate `Blocked IPs`
- Select the IP and click `Unblock IP`
- Reconnect with valid credentials

## Cancel download causes the UI to hang

### Notes

- For very large transfers, the UI may take a short moment while active workers stop

### Suggestions

- Test with the latest build
- Reduce `Threads/File` or `Parallel Files` if the machine is under heavy load

## GitHub release error: `Repository is empty`

### Cause

- The GitHub repository has no commits yet

### Fix

- Push at least one commit before creating the first release

## GitHub release error: `Resource not accessible by personal access token`

### Cause

- The token does not have enough permissions

### Fix

- Ensure the token includes:
  - `Contents: Read and write`
  - `Metadata: Read-only`

## App does not start on a new machine

### Check

- Was the full publish folder copied?
- If using the framework-dependent build, is `.NET Desktop Runtime 9.0 x64` installed?
- Is antivirus blocking the executable?

### Preferred fix

- use the official `Setup.exe` instead of manually copying partial files whenever possible
