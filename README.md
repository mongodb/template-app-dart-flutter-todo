# Realm Flutter Todo

A todo list application built with the [Realm Flutter SDK](https://www.mongodb.com/docs/realm/sdk/flutter/) and [Atlas Device Sync](https://www.mongodb.com/docs/atlas/app-services/sync/).

You can follow along with the [Flutter Tutorial](https://www.mongodb.com/docs/atlas/app-services/tutorial/flutter/) to see how to build, modify, and
run this template app.

## Configuration

For this template app to work, you must ensure that `/assets/config/atlasConfig.json` exists and contains the following properties:

- **appId:** your Atlas App Services App ID.
- **baseUrl:** the App Services backend URL. This should be https://realm.mongodb.com in most cases.

### Using the Atlas App Services UI

The easiest way to use this template app is to log on to [Atlas App Services](https://realm.mongodb.com/) and click the **Create App From Template** button. Choose
**Real Time Sync**, and then follow the prompts. While the backend app is being
created, you can download this Flutter template app pre-configured for your new
app.

### Cloning from GitHub

If you have cloned this repository from the GitHub
[mongodb/template-app-dart-flutter-todo](https://github.com/mongodb/template-app-dart-flutter-todo.git)
repository, you must create a separate App Services App with Device Sync
enabled to use this client. You can find information about how to do this
in the Atlas App Services documentation page:
[Template Apps -> Create a Template App](https://www.mongodb.com/docs/atlas/app-services/reference/template-apps/)

Once you have created the App Services App, replace any value in this client's
`appId` field with your App Services App ID. For help finding this ID, refer
to: [Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

### Download the Client as a Zip File

If you have downloaded this client as a .zip file from the Atlas App Services
UI, it does not contain the App Services App ID. You must replace any value
in this client's `appId` field in `/assets/config/atlasConfig.json`
with your App Services App ID. For help finding this ID, refer to:
[Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

## Getting Started

1. Clone and enter the project
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

Please report issues with the template at https://github.com/mongodb-university/realm-template-apps/issues/new .
