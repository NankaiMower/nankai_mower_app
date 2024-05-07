#!/bin/bash

flutter doctor

flutter clean

flutter build web --web-renderer canvaskit
flutter build apk --debug
flutter build apk --release

flutter run --web-renderer canvaskit

python -m http.server 8080