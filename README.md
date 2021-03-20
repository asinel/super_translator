# super_translator

A simple Flutter app using Google Translator API

## Getting Started

This project uses Google Translate Cloud API, so you need to have API key

Create a .env file in the root of the project, and paste it there:
`GOOGLE_API_KEY=AIzaXXXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXXX`

Cause this project is already migrated to null-safety, but some libraries do not (flutter-dotenv), you should add --no-sound-null-safety param to flutter run
`flutter run --no-sound-null-safety`
