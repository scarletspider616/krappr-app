# krappr

A new Flutter project.

## Getting Started

Run like any other [flutter](https://flutter.dev) project:

`flutter run`

## Google Maps API Key

To use the google maps features of this app in development, you'll
need to add your Google Maps API Key.

If you don't already have one, generate it [here](https://developers.google.com/maps/documentation/javascript/get-api-key)

### iOS

copy

`ios/Runner/Constants.swift.example`

to

`ios/Runner/Constants.swift`

and replace

`INSERT DEVELOPER KEY HERE`

with your Google Maps API Key.

### Android

Add

`google.map.key=<YOUR API KEY HERE>`

to

`android/local.properties`
