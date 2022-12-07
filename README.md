# Realm Flutter Todo

A todo list application built with the [Realm Flutter SDK](https://www.mongodb.com/docs/realm/sdk/flutter/)
and [Atlas Device Sync](https://www.mongodb.com/docs/atlas/app-services/sync/).

## Configuration

Ensure `flutter_todo/assets/config/realm.json` exists and contains the following properties:

- **appId:** your Atlas App Services App ID.
- **baseUrl:** the App Services backend URL. This should be https://realm.mongodb.com in most cases.

### Cloning from GitHub

If you have cloned this repository from the GitHub 
[mongodb/template-app-dart-flutter-todo](https://github.com/mongodb/template-app-dart-flutter-todo.git) 
repository, you must create a separate App Services App with Device Sync 
enabled to use this client. You can find information about how to do this 
in the Atlas App Services documentation page:
[Template Apps -> Create a Template App](https://www.mongodb.com/docs/atlas/app-services/reference/template-apps/#create-a-template-app)

Once you have created the App Services App, replace any value in this client's
`appId` field with your App Services App ID. For help finding this ID, refer 
to: [Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

## Run the App

1. Enter the project
2. `flutter pub get`
3. Run the app:
   - on Windows, Linux and macOS `flutter run`
   - on Android emulator or iOS Simulator
     `flutter run` if only one emulator or iOS Simulator is available.
     or get the device id with `flutter devices` and start the app `flutter run -d <device-id>`
     For more information on running a Flutter app see the [Flutter Test Drive documentation](https://docs.flutter.dev/get-started/test-drive).

## Build on the App

Learn about how to build a feature on top of this application in the [Flutter Device Sync Tutorial](https://www.mongodb.com/docs/atlas/app-services/tutorial/flutter/).

## Issues

Please report issues with the template at https://github.com/mongodb-university/realm-template-apps/issues/new
