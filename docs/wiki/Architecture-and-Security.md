# Architecture and Security

## High-Level Architecture

The solution is organized into four main parts:

- `BigskyTranferFiles.Desktop`
  - Unified shell that hosts `Server Screen` and `Client Screen`
- `BigskyTranferFiles.Server`
  - Server dashboard and server-side services
- `BigskyTranferFiles.Client`
  - Client dashboard and transfer engine
- `BigskyTranferFiles.Shared`
  - Shared models, packet framing, helpers, and MVVM infrastructure

From an end-user perspective, the most important point is that all operational workflows are surfaced through one desktop application even though the runtime behavior is split into server-side and client-side modules internally.

## Communication Model

- Client and server communicate through a custom TCP protocol
- Multiple simultaneous connections are used for transfer work
- Heartbeat logic is used to detect dropped sessions
- Resume support uses chunk checkpoints and a recovery queue

## Transfer Performance Design

- Multi-threaded download and upload
- `Threads/File` controls concurrency within a file
- `Parallel Files` controls concurrency across files
- Chunk-based resume after interruption
- Optional `Fast Mode` to skip checksum verification after transfer

## Security Model

### Optional TLS

- TLS can be enabled or disabled between client and server
- Default state is `OFF`
- The server can generate a self-signed certificate

### Trust On First Use

- The client pins the server certificate on the first successful TLS connection
- Later connections trust only the pinned certificate unless it is cleared

### Login Protection

- Failed login attempts are limited
- Temporary lockout is enforced by IP
- Manual `Block IP` and `Unblock IP` actions are available in `Server Screen`

## Reliability Features

- Recovery queue after crash or abrupt closure
- Live progress, elapsed time, and speed tracking
- Transfer history on both server and client
- Internal update support for controlled rollout

## Release Engineering

- Framework-dependent publish
- Self-contained publish
- Inno Setup installer
- GitHub release automation

## Distribution Perspective

BigskyTranferFiles can be operated successfully even when the public repository only exposes release artifacts such as:

- the published application folder
- the installer
- the update manifest

That makes the platform suitable for internal binary-first distribution models where source publication is not required.
