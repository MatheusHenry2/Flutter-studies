# Login App

This Flutter project has been reset with a simple login screen following the Model-View-Intent pattern.

## Firebase setup

1. Add your `google-services.json` file to `android/app/` and `GoogleService-Info.plist` to `ios/Runner/`.
2. Run `flutterfire configure` to generate `lib/firebase_options.dart` with your Firebase credentials.
3. The app initializes Firebase on startup using the generated options.
