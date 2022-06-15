# Horizon - App

The desktop application written in Flutter.

## Stack

- Flutter

- [Bloc and Cubit](https://bloclibrary.dev/#/) for state management

- [get_it](https://pub.dev/packages/get_it) for dependency injection

- [gRPC](https://grpc.io/) for data fetching

- [just_audio](https://pub.dev/packages/just_audio) to play the audio

## Architecture

The architecture of this app is based on Reso Coder's [Domain Driven Design Principles](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/):

![DDD architecture](https://resocoder.com/wp-content/uploads/2020/03/DDD-Flutter-Diagram-v3.svg)

> **Application** contains all the Use Cases

> **Domain** contains the business logic (entities and validation)

> **Infrastructure** contains the repositories and network calls as well as Data Transfer Objects

> **Presentation** contains all the UI components

## Installation

This app was created and tested on `Flutter 3.0.1` and `Dart 2.17.1` .

```
cd app
flutter packages get
```

For debug mode run `flutter run` and for production mode run `flutter run --release`

To run the code generator using `freezed`, run `flutter pub run build_runner watch --delete-conflicting-outputs`.

If you want to use your own server you will need to change the `BaseUrl` in `InjectableModule`.

**Note**: Instead of `localhost` you need to specify your `IPv4 Address` (e.g. `192.168.2.xxx`), otherwise the gRPC client won't be able to connect to the server.

## Platform specific configuration

This app was created and tested on Windows.

To get it working on other platforms you need to configure the following packages:

- [just_audio](https://pub.dev/packages/just_audio#platform-specific-configuration)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)

## Build

1. Run `flutter build windows`
2. Find the files in `build\windows\runner\Release`

## Tests

This repository has a few example tests written to show how you could test the app.

To run them run `flutter test`.

## Credits

[Reso Coder](https://resocoder.com/): This app's structure is based on his DDD tutorial and the tests are based on his TDD tutorial.

[MarcusNg](https://github.com/MarcusNg/flutter_spotify_ui): This app's UI builds upon his YouTube video.

<a href="https://www.flaticon.com/free-icons/spotify" title="spotify icons">Spotify icons created by Fathema Khanom - Flaticon</a>
