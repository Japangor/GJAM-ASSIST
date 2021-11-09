# GJAMAssist

GJAMAssist is an open source Flutter-based template for a business assistant application. It has been designed to use [Google Firebase](firebase.google.com/) as backend.


## Features

- Invoice generator
- Party (supplier/customer) statement generator
- Invoice/voucher viewer
- Business dashboard
- Report screens for account payable, receivables, stock items

### Screenshots

<p align="center">
    <img src="https://github.com/Japangor/GJAM-ASSIST/blob/main/assets/images/PS-2.png" alt="Ledger statements" width="200"/>
    <img src="https://github.com/Japangor/GJAM-ASSIST/blob/main/assets/images/PS-1.png" alt="GST Invoices" width="200"/>
    <img src="https://github.com/Japangor/GJAM-ASSIST/blob/main/assets/images/PS-3.png" alt="Invoice PDFs" width="200"/>
    <img src="https://github.com/Japangor/GJAM-ASSIST/blob/main/assets/images/PS-4.png" alt="Dashboard" width="200"/>
    <img src="https://github.com/Japangor/GJAM-ASSIST/blob/main/assets/images/PS-5.png" alt="Menu" width="200"/>
</p>

## Setup

Start out by [cloning this repo](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository).

### Flutter

- Install Flutter by following the [official documentation](https://flutter.dev/docs/get-started/install) if you haven't.
- Using VSCode or Android Studio as your choice of IDEs is highly recommended. You can find official Flutter documentation for getting up and running with them [here](https://flutter.dev/docs/development/tools).
- Make sure that you are on Flutter's `stable` [channel](https://flutter.dev/docs/development/tools/sdk/upgrading#switching-flutter-channels)
  - `flutter channel stable`

### Firebase

- Default app name is `com.example.tassist`. Choose your app's name and replace the default name in the following files.
  - `android/app/build.gradle`
  - `android/app/src/main/AndroidManifest.xml`
  - `android/app/src/debug/AndroidManifest.xml`
  - `android/app/src/profile/AndroidManifest.xml`
  - `android/app/src/main/kotlin/com/example/MainActivity.kt`
- Set up a Firebase project, generate a configuration file and copy the file to this repo by following Steps 1-3 listed [here](https://firebase.google.com/docs/flutter/setup?platform=android).
- Enable `Email/Password` authentication method in the Firebase console. You can find it under `Develop`>`Authentication`>`Sign-in method`.
- Enable [Cloud Firestore](https://firebase.google.com/docs/firestore) by going to `Develop`>`Database`.

