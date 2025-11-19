# 🛠 Guide to apply this Flutter Base

Follow the steps below to apply this base Flutter code to your own project:

## 🔧 Environment Setup

- Install [FVM](https://fvm.app/documentation/getting-started/installation) to manage Flutter versions.

```
brew tap leoafarias/fvm
brew install fvm
```

- Install [Mason CLI](https://github.com/felangel/mason/tree/master/packages/mason_cli) to use code generation bricks.

```
brew tap felangel/mason
brew install mason
```

### Add the `mvvm_screen` Brick

- Copy the `.brick/mvvm_screen` folder from the base repo.
- Copy the `mason.yaml` file from the base.
- Run `mason get`.

## ⚙️ Makefile Setup

- Copy the `Makefile` from the base repo.
- On Windows, install the `make` tool if it's not already available.

## 🌐 Localization Setup

- Copy the `l10n.yaml` file from the base.
- Place `.arb` files and generated localization code in the `lib/res/l10n` directory.
- Follow the official [Flutter localization guide](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization).

## 🎨 FlutterGen Setup

- Copy the FlutterGen configuration section from the base `pubspec.yaml`.
- Add the `/assets/colors/colors.xml` file for defining custom colors.
- Generated files should be located in the `res/gen` directory.

## 🧹 Linting & Code Standards

- Copy the `analysis_options.yaml` file from the base repo.
- Use [flutter_lints](https://pub.dev/packages/flutter_lints) to enforce linting rules.

## 📦 Library Setup

- Add [mockito](https://pub.dev/packages/mockito) for mocking in tests.
- Add [riverpod](https://riverpod.dev) for state management.
- Add [freezed](https://pub.dev/packages/freezed) for generating immutable models.
- (Optional) Add [dio](https://pub.dev/packages/dio) and [retrofit](https://pub.dev/packages/retrofit) for API communication.
- (Optional) Add [logger](https://pub.dev/packages/logger) for logging.

## 📁 Project Configuration

- Copy the `.gitignore` file from the base.
- Copy the `.vscode/settings` folder from the base.
- Copy the `.github` folder from the base.

## 🏗️ Flavor Setup

- Configure Android flavors: [Flutter Android Flavors](https://docs.flutter.dev/deployment/flavors)
- Configure iOS/macOS flavors: [Flutter iOS Flavors](https://docs.flutter.dev/deployment/flavors-ios)
- Add `main_dev.dart`, `main_stg.dart`, `main_prod.dart`, and `main.dart` files as structured in the base.
- Update `.vscode/launch.json` to match the base setup.

## 📚 Documentation & Structure

- Copy the `README.md` file from the base and update its content for your project.
- Create the same folder structure as in the base code.
- Reuse and adapt the logic from the base code as needed.
