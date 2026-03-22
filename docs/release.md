# Creating a new Android release

This guide covers bumping the app version, building a release APK, and publishing it as a downloadable GitHub Release.

Prerequisites:

- [Flutter](https://docs.flutter.dev/get-started/install) SDK on your PATH
- A clone of this repository
- For uploading releases: [GitHub CLI](https://cli.github.com/) (`gh`) authenticated (`gh auth login`), or use the GitHub web UI instead

---

## 1. Version bump

The **single source of truth** for Android `versionName` and `versionCode` is `pubspec.yaml`:

```yaml
version: 1.0.8+9
```

- **Before `+`:** user-visible version (`versionName` on Android), e.g. `1.0.8` — use [semantic versioning](https://semver.org/) as appropriate (patch/minor/major).
- **After `+`:** integer build number (`versionCode` on Android), e.g. `9` — **must increase** for every upload to Google Play; for GitHub-only releases, still bump it so installs are ordered correctly.

**Steps:**

1. Edit `pubspec.yaml` and set a new `version`, for example:
   - From `1.0.8+9` → `1.0.9+10` (new patch and higher build number).
2. Run:

   ```bash
   flutter pub get
   ```

3. Commit the change (recommended so the tag matches the tree users build from):

   ```bash
   git add pubspec.yaml
   git commit -m "chore: bump version to 1.0.9+10"
   ```

`android/app/build.gradle.kts` reads `versionName` and `versionCode` from Flutter; you do not need to edit Gradle for a normal bump.

---

## 2. Build the release APK

From the repository root:

```bash
flutter build apk --release
```

**Output path:**

```text
build/app/outputs/flutter-apk/app-release.apk
```

**Signing:**

- If `android/key.properties` exists (see `android/app/build.gradle.kts`), the release build uses your Play/App signing keystore.
- If it does not exist, release builds still succeed but are signed with the **debug** keystore — fine for internal testing; use your real keystore for store or wide distribution.

Optional: confirm the version on the built artifact (example):

```bash
# macOS: path to aapt may vary; or inspect the APK in Android Studio
```

---

## 3. Publish a GitHub Release with the APK

### Option A: GitHub CLI (recommended)

1. Push your version-bump commit (and branch) if needed:

   ```bash
   git push origin <your-branch>
   ```

2. Create a tag that matches the release (example for `1.0.9`):

   ```bash
   git tag v1.0.9
   git push origin v1.0.9
   ```

3. Create the release and attach the APK (rename the asset for clarity):

   ```bash
   cp build/app/outputs/flutter-apk/app-release.apk flutterclaw-1.0.9.apk

   gh release create v1.0.9 \
     --title "v1.0.9" \
     --notes "Brief release notes here." \
     flutterclaw-1.0.9.apk
   ```

Users will see `flutterclaw-1.0.9.apk` under **Assets** on the release page.

**Notes:**

- Replace `v1.0.9` and filenames with the same version you put in `pubspec.yaml` (the part before `+`).
- You can add `--prerelease` or `--draft` if needed.

### Option B: GitHub web UI

1. Push your commits and create a tag (`v1.0.9`) as above, or create the tag when drafting the release in the UI.
2. Open the repository on GitHub → **Releases** → **Draft a new release**.
3. Choose the tag, set title and description, then **Attach binaries** and upload `app-release.apk` (optionally renamed, e.g. `flutterclaw-1.0.9.apk`).
4. Publish the release.

---

## Checklist

| Step | Action |
|------|--------|
| 1 | Increase `version` in `pubspec.yaml` (`name+build`) |
| 2 | `flutter pub get` and commit `pubspec.yaml` |
| 3 | `flutter build apk --release` |
| 4 | Tag, push tag, `gh release create` (or web UI) with APK attached |

---

## Troubleshooting

- **Build fails:** Run `flutter doctor` and fix reported issues; ensure Android toolchain is installed.
- **Wrong version inside the app:** Confirm `pubspec.yaml` was saved and rebuild after the bump; clean if needed: `flutter clean && flutter pub get && flutter build apk --release`.
