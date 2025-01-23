Mobikul Custom AppBar Flutter Package #

MobikulCustomAppBar is a highly customizable Flutter widget for creating app bars with dynamic features and styles. It supports custom titles, actions, background colors, and integrates seamlessly with your app's theme.

To find out more, visit: https://mobikul.com/

Features #

The MobikulCustomAppBar package provides a highly customizable AppBar widget for Flutter applications. Key features include:


- **Dynamic Heading and Style**
   Customizable title with adjustable text styles.
- **App Logo Support**
   Toggle to show/hide logo, supports dark mode, adjustable size, and placeholder.
- **Leading Button Options**
   Back/clear button with custom actions and automatic navigation handling.
- **AppBar Appearance**
   Customizable background color and elevation.
- **Action Widgets**
   Add buttons for extended functionality.
- **Home Navigation Support**
   Optional logo-based home navigation.
- **Build Context Flexibility**
   Takes BuildContext as a parameter, ensuring seamless integration with the Flutter widget tree.
- **Optimized Visibility Logic**
   Auto-manages logo visibility.
- **Developer-Friendly Defaults**
   Predefined logo size and background color for quick setup.

## Installation
To add MobikulCustomAppBar to your project, include the following in your pubspec.yaml file:

```yaml
dependencies:
   mobikul_custom_app_bar: ^0.0.2  # Replace with the latest version
```

Then, fetch the package using the command:

```bash
flutter pub get
```

## Usage

### Here’s how to use the MobikulCustomAppBar in your Flutter app:



### Import the Package
```dart
import 'package:mobikul_custom_app_bar/mobikul_custom_app_bar.dart';
```

### Basic CustomAppBar Example
```dart
  Scaffold(
      appBar: MobikulCustomAppBar(
        "Mobikul Custom App Bar",
          context,
         Theme.of(context).textTheme.bodyLarge,
        isHomeEnable: true,
        isElevated:false,
        isAppLogoForDarkmode: true,
        appBarBackgroundColor: Colors.green,
        appLogoUrl: "https://example.com/image1.png",
        logoHeight: 40,
        logoWidth: 40,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
            print("Search Screen");
          }, icon:  Icon(Icons.search),),

          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
            print("Settings Screen");
          }, icon:  Icon(Icons.settings),),

        ],
        showAppLogo: true,
      )
  );
  ```

## Properties

| Property             | Type             | Default                    | Description                               |
|----------------------|------------------|----------------------------|-------------------------------------------|
| `heading`              | `String`         | `Required`                       | Title text for the AppBar.                |
| `headingStyle`           | `TextStyle?`     | `Theme.of(context).textTheme.bodyLarge`                   | Style for the title text.                 |
| `showAppLogo`               | `bool`           | `Required`                    | Displays the app logo.                    |
| `context` | `BuildContext`   | `Required`         | Current context for navigation and theme. |
| `isElevated`     | `bool`           | `true`                    | Adds shadow to the AppBar.                |
| `isLeadingEnable`   | `bool`           | `false`                     | Enables back/clear button.                |
| `isHomeEnable`    | `bool`           | `false`                     | Shows a home icon or logo.                |
| `isAppLogoForDarkmode` | `bool?`          | `false`                     | Uses dark mode logo if true.              |
| `actions`    | `List<Widget>?`  | `null`                     | Action buttons on the AppBar.             |
| `appLogoUrl`    | `String?`        | `null`                     | URL of the app logo for light mode.       |
| `darkAppLogoUrl`    | `String?`        | `null`                     | URL of the app logo for dark mode.        |
| `placeHolderImage`    | `String?`        | `null`                     | Fallback image if logo fails to load.     |
| `appBarBackgroundColor`    | `Color?`        | `Colors.white`                     | Background color of the AppBar.           |
| `logoWidth`    | `double?`        | `30.0`                     | Width of the app logo.          |
| `logoHeight`    | `double?`        | `30.0`                     | Height of the app logo.         |

## Output

Here’s an example of the `MobikulCustomAppBar` in action:

![Mobikul Custom AppBar](MobikulCustomAppBar.gif)





