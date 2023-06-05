# EVM

## HOW TO BUILD

### 1. For Android (apk)
- Dev: `flutter build apk -t lib/main_dev.dart --flavor dev`
- Staging Dev: `flutter build apk -t lib/main_staging_dev.dart --flavor staging`
- Staging: `flutter build apk -t lib/main_staging.dart --flavor staging`
- Production:  `flutter build apk -t lib/main.dart --flavor production`


### 2. For Android (aab):
- Dev: `flutter build appbundle -t lib/main_dev.dart --flavor dev`
- Staging Dev: `flutter build appbundle -t lib/main_staging_dev.dart --flavor staging`
- Staging: `flutter build appbundle -t lib/main_staging.dart --flavor staging`
- Production:  `flutter build appbundle -t lib/main.dart --flavor production`

### 3. For iOS (ad-hoc):
- Dev: `flutter build ipa -t lib/main_dev.dart --flavor dev --export-method=ad-hoc`
- Staging Dev: `flutter build ipa -t lib/main_staging_dev.dart --flavor staging --export-method=ad-hoc`
- Staging: `flutter build ipa -t lib/main_staging.dart --flavor staging --export-method=ad-hoc`
- Production: `flutter build ipa -t lib/main.dart --flavor production --export-method=ad-hoc`

### 4. For iOS (App Store)
- Dev: `flutter build ipa -t lib/main_dev.dart --flavor dev`
- Staging Dev: `flutter build ipa -t lib/main_staging_dev.dart --flavor staging`
- Staging: `flutter build ipa -t lib/main_staging.dart --flavor staging`
- Production: `flutter build ipa -t lib/main.dart --flavor production`