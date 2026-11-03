---
trigger: always_on
description: Enforce multi-flavor versioning rules and git branch promotion conventions across dev, staging, and prod.
---

## Multi-Flavor Versioning & Branch Promotion Rules

Whenever committing or preparing to merge/push to `dev`, `staging`, or `main`, adhere strictly to these rules:

### 1. Branch Roles & Target Flavors
- **`dev`**: The bleeding-edge development branch (paired with the `dev` flavor).
  - Version format in `pubspec.yaml`: `0.X.Y+BUILD` (or `X.Y.Z-dev.N+BUILD`).
  - Merges into `dev` must increment `BUILD` by 1.
  - Tag format: `vX.Y.Z-dev.N`.
- **`staging`**: The release candidate & pilot branch (paired with the `staging` flavor).
  - Version format in `pubspec.yaml`: `X.Y.Z-rc.N+BUILD`.
  - Tag format: `vX.Y.Z-rc.N`.
- **`main`**: The production branch (paired with the `prod` flavor).
  - Version format in `pubspec.yaml`: Clean SemVer `X.Y.Z+BUILD`.
  - Tag format: `vX.Y.Z`.

### 2. Pre-Push Verification Checklist
Before any push or merge into `dev`, `staging`, or `main`:
1. Verify `pubspec.yaml` has the correct `version: x.y.z+build` according to the target branch.
2. Ensure `BUILD` is monotonically increasing (never decremented).
3. Ensure `flutter analyze` and `dart run tool/check_architecture.dart` pass with 0 issues.
4. Apply the appropriate git tag matching the branch convention (`vX.Y.Z-dev.N`, `vX.Y.Z-rc.N`, or `vX.Y.Z`).
