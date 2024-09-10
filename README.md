# Flutter SDK Todo

A todo list application built with the [Atlas Device SDK for Flutter](https://www.mongodb.com/docs/realm/sdk/flutter/) and
[Atlas Device Sync](https://www.mongodb.com/docs/atlas/app-services/sync/).

> **TIP:** Follow along with the [Flutter Tutorial](https://www.mongodb.com/docs/atlas/app-services/tutorial/flutter/)
> to see how to build, modify, and run this template app.

> [!WARNING]
> As of September 2024, Atlas Device SDKs are deprecated. Atlas Device SDKs
> will reach end-of-life and will no longer be maintained by MongoDB on
> September 30, 2025.
>
> The template app in this repository should only be used as a reference for
> the on-device database and not to create a new app based on Device Sync.
> Refer to the [deprecation page](https://www.mongodb.com/docs/atlas/device-sdks/>deprecation/) for details.

## Create Your App

You can get started with this template app in two ways:

- Create a new pre-configured template app and get started immediately
- Clone the GitHub
  [mongodb/template-app-dart-flutter-todo](https://github.com/mongodb/template-app-dart-flutter-todo.git)
  repository and use it with a new or existing App Services App backend

### Create a Template App from the App Services UI or CLI (Recommended)

The easiest way to work with this template app is to create a new App Services
App based on this Flutter template. The app is configured
to run this client as a Real-Time Sync demo and comes pre-populated with the
correct values for your app.

- To create an App from the UI:

  1. Log on to [Atlas App Services](https://services.cloud.mongodb.com).
  2. Click the **Create App From Template** button.
  3. Select **Real Time Sync**, and follow the prompts.
  4. Download the front-end code for your app.

- To create an App from the CLI:

  1. Log on to the CLI
     ```shell
     appservices login --api-key="<YOUR-API-KEY>" --private-api-key="<YOUR-PRIVATE-API-KEY>"
     ```
  2. Create the app
     ```shell
     appservices apps create --template flutter.todo.flex -n "<YOUR-APP-NAME>"
     ```
  3. Work with your app
     ```shell
     cd "<YOUR-APP-NAME>"/frontend/flutter.todo.flex
     ```

You're all set with a pre-configured app that's ready to run!

### Clone from GitHub

If you choose to clone this project from GitHub, you can use it with an existing
App Services App or you can create a new one. The only requirement is that your
app has [Device Sync](https://www.mongodb.com/docs/atlas/app-services/sync/) enabled.

1. Clone the GitHub
   [mongodb/template-app-dart-flutter-todo](https://github.com/mongodb/template-app-dart-flutter-todo.git)
   repository.
2. If you don't already have an App Services App, [create an App](https://www.mongodb.com/docs/atlas/app-services/apps/create/#std-label-create-app) with Device Sync
   enabled. This is the backend that you'll configure to use with this client
   template.
3. Note your App ID, Project ID, and cluster name. You'll need it in the next
   step.

#### Configure Your App with this Client Template

1. Open your `/assets/config/atlasConfig.json` file. It should contain the
   following:

   - **appId:** your Atlas App Services App ID. This should be similar to `YOUR-APP-ID-123XYZ`.
   - **baseUrl:** the App Services backend URL. This should be `https://services.cloud.mongodb.com` in most cases.
   - **dataExplorerLink:** the App Services Data Explorer URL that lets you
     view your synced data in Atlas from the app. This should be similar to
     `https://cloud.mongodb.com/links/<YOUR-ATLAS-PROJECT-ID>/explorer/<YOUR-CLUSTER-NAME>/database/collection/find`.

2. Update with the values for your app:

   - Your App ID: [How to find your App ID](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/).
   - Your Project ID: [How to find your Project ID](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/).
   - Your cluster name. If you used the default, this is `Cluster0`.

## Run the App

1. Navigate to the project.
2. Run `flutter pub get`
3. Run the app:
   - on Windows, Linux and macOS: `flutter run`
   - on Android emulator or iOS Simulator:
     - if only one emulator or iOS Simulator is available: `flutter run` .
     - if multiple are available, get the device id: `flutter devices`, and
       start the app: `flutter run -d <device-id>`

For more information on running a Flutter app, refer to the
[Flutter Test Drive](https://docs.flutter.dev/get-started/test-drive) documentation.

## Build on the App

Once you're up and running, you can get started building on this template.

Or you can follow along with the [Flutter Tutorial](https://www.mongodb.com/docs/atlas/app-services/tutorial/flutter/)
to learn how to build on top of this template app.

## Troubleshooting

### Initializer error

```
[ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: type 'Null' is not a subtype of type 'String'
```

This error occurs if the `dataExplorerLink` field in your
`/assets/config/atlasConfig.json` is invalid.

To resolve it, ensure the `dataExplorerLink` field is populated with the correct
project ID and cluster name values.

> **NOTE:** If you used the Flutter template app, then this
> field should have been pre-populated with the correct URL.

## Issues

Please report issues with the template at
https://github.com/mongodb-university/realm-template-apps/issues/new.

## Additional Resources

- For more information on this and the other available Atlas Device SDK template
  apps, check out the App Services
  [Template App](https://www.mongodb.com/docs/atlas/app-services/reference/template-apps/)
  documentation.

- Learn more about developing with the Flutter SDK with the [Atlas Device
  SDK](https://www.mongodb.com/docs/atlas/device-sdks/sdk/flutter/)
  and [API](https://pub.dev/documentation/realm/latest/) docs.

- Check out some example Flutter and Dart apps built using the Flutter SDK
  in the
  [realm-dart-samples](https://github.com/realm/realm-dart-samples/tree/main)
  GitHub repo.
