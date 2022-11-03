# Calendarific
## _Consuming a RESTful API with_ 


[![N|Solid](https://i.imgur.com/uaRBLLo.png)



The app consists of two screens with almost the same content. You need to retrieve the data from the public holiday calendar API which can be found here: https://calendarific.com/api-documentation.

The app consists of two screens: 
- Screen 1 (FRANCE holidays):
    - Button to go to the second screen 
    - Search to select the year 
    - List showing the holidays returned by the API 
- Screen 2 (SPAIN holidays):
    - Button to go to the first screen 
    - Search to select the year 
    - List showing the holidays returned by the API 

## Dependencies

This application uses the following packages:

- [Get](https://pub.dev/packages/get) - GetX is an extra-light and powerful solution for Flutter. It combines high-performance state management, intelligent dependency injection, and route management quickly and practically.
- [Http](https://pub.dev/packages/http) - A persistent/static bottom navigation bar for Flutter.
- [Persistent Bottom Navigation Bar Version 2](https://pub.dev/packages/persistent_bottom_nav_bar_v2) - A persistent/static bottom navigation bar for Flutter.

- [intl](https://pub.dev/packages/intl) - Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.

- [DotEnv](https://pub.dev/packages/dotenv) - Load configuration at runtime from a .env file which can be used throughout the application.

## Installation

This app requires [Dart](https://dart.dev/) SDK >= 2.18.4 < 3.0.0 to run,  [Flutter](https://flutter.dev/brand) SDK 3.3.7 and the above dependencies

If you have a deprecated version of Flutter/Dart or packages: 
```sh
flutter upgrade
```
If you have deprecated packages: 
```sh
flutter pub upgrade
```
For Flutter/Dart installation errors or project misconfigurations
```sh
flutter doctor
```
Install the dependencies and devDependencies and start the server.

```sh
flutter pub get
flutter run
```

## Structure of the app
[![N|Solid](https://i.imgur.com/uaRBLLo.png)

- **API Controller**: It is in charge of handling the API response and indicates whether the response was received correctly or not.
- **Binding**: It is in charge of managing the response of the model dependencies or controllers of each view or page. 
- **JSON Model**: It is in charge of creating a schema in dart to manage and get specific data from the json response.
- **Route helper**: It is in charge of managing the navigation paths of each screen in addition to the home page.
- **Screens**: Each screen consists of a main screen and its body, the latter of which is responsible for displaying the list of API holiday dates on the screen. 
    - *home_screen*: It manages the layout of all the screens and instances in the navigation bar, which is in charge of making the transitions between each screen.
- **Widgets**: Various widgets displayed on different screens. Used to improve scalability, code readability and avoid repetitive code.
- **Size Configuration**: Responsible for knowing the screen dimensions of the device to achieve a responsive design of the application.
