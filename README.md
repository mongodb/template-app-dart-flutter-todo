# Realm Flutter Todo

A todo list application built with the [Realm Flutter SDK](https://www.mongodb.com/docs/realm/sdk/flutter/) and [Atlas Device Sync](https://www.mongodb.com/docs/atlas/app-services/sync/).

You can follow along with the [Flutter Tutorial](https://www.mongodb.com/docs/atlas/app-services/tutorial/flutter/) to see how to build, modify, and
run this template app.

## Configuration

For this template app to work, you must ensure that `/assets/config/atlasConfig.json` exists and contains the following properties:

- **appId:** your Atlas App Services App ID.
- **baseUrl:** the App Services backend URL. This should be https://services.cloud.mongodb.com in most cases.
- **dataExplorerLink:** the App Services Data Explorer URL. This should be similar to https://cloud.mongodb.com/links/<YOUR-ATLAS-PROJECT-ID>/explorer/<YOUR-CLUSTER-NAME>/database/collection/find

### Using the Atlas App Services UI

The easiest way to use this template app is to log on to [Atlas App Services](https://services.cloud.mongodb.com) and click the **Create App From Template** button. Choose
**Real Time Sync**, and then follow the prompts. While the backend app is being
created, you can download this Flutter template app pre-configured for your new
app.

When you download the Flutter template from the Atlas App Services UI,
the `atlasConfig.json` comes pre-populated with the correct values for your
application. You can proceed to **Getting Started** below.

### Cloning from GitHub

If you have cloned this repository from the GitHub
[mongodb/template-app-dart-flutter-todo](https://github.com/mongodb/template-app-dart-flutter-todo.git)
repository, you must create an App Services App with Device Sync
enabled to use this client. Then, you must manually populate the values in
the `/assets/config/atlasConfig.json` file that the Flutter client references
when it runs.

#### Create an App Services app

You can find information about how to create an App Services App configured
to run this client as a Real-Time Sync demo in the Atlas App Services
documentation page:
[Template Apps -> Create a Template App](https://www.mongodb.com/docs/atlas/app-services/reference/template-apps/)

#### Populate fields in your atlasConfig.json

For this template app to work, you must ensure that
`/assets/config/atlasConfig.json` exists and contains the following properties:

- **appId:** your Atlas App Services App ID.
- **baseUrl:** the App Services backend URL. This should be https://services.cloud.mongodb.com in most cases.
- **dataExplorerLink:** the App Services Data Explorer URL. This should be similar to https://cloud.mongodb.com/links/<YOUR-ATLAS-PROJECT-ID>/explorer/<YOUR-CLUSTER-NAME>/database/collection/find

Once you have created the App Services App, replace any value in the
`appId` field with your App Services App ID. For help finding this ID, refer
to: [Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

If you do not populate the `appId` field, the app will compile and run but you
won't be able to create users or log in to Atlas.

Add a field called `dataExplorerLink`, and populate it with your Atlas
Data Explorer link. This link is similar to:

```
https://cloud.mongodb.com/links/YOUR-ATLAS-PROJECT-ID/explorer/YOUR-CLUSTER-NAME/database/collection/find
```

Replace `YOUR-ATLAS-PROJECT-ID` with your Atlas Project ID. For help finding
this ID, refer to: [Find your Atlas Project Id](https://www.mongodb.com/docs/atlas/app-services/apps/metadata/#find-your-atlas-project-id)

Replace `YOUR-CLUSTER-NAME` with the name of your Atlas cluster. If you accept
the default value when you create the cluster, the cluster name is `Cluster0`.

If you do not create a `dataExplorerLink` field, the app will throw the
following error:

```
[ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: type 'Null' is not a subtype of type 'String'
```

This only occurs when you clone the Flutter client from GitHub. It does not
occur when you download the client from Atlas, because it comes pre-populated
with the correct fields and values for your application.

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
