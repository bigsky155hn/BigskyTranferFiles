# Release Repository Policy

This repository is intended to remain a **release-only repository**.

## What should be kept in this repository

- `README.md`
- `docs/`
- `publish/BigskyTranferFiles`
- `publish/installer`
- `run-app.cmd`

## What should not be added to this repository

- source code
- solution files
- build scripts
- installer authoring scripts
- certificates
- local development artifacts
- temporary or repro folders

## Recommended publishing model

1. Build the product in a separate internal source repository
2. Copy the final published application package into:
   - `publish/BigskyTranferFiles`
3. Copy the release assets into:
   - `publish/installer`
4. Update `README.md` or release notes if needed
5. Publish the installer and manifest to GitHub Releases

## Reason for this policy

This repository is meant for:

- end users
- internal operators
- binary distribution
- installer-based rollout
- update consumption

It is not meant to serve as the primary development repository.
