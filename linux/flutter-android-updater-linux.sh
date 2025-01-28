#!/bin/bash
# Update Gradle, Java, and other Android project settings in a Flutter project

# Configuration des versions désirées
DESIRED_GRADLE_VERSION="8.9"
DESIRED_JAVA_VERSION="17"
DESIRED_NDK_VERSION="27.0.12077973"
DESIRED_MIN_SDK_VERSION="24"
DESIRED_TARGET_SDK="34"
DESIRED_ANDROID_APPLICATION_VERSION="8.7.2"

# Vérifie si c'est un projet Flutter
if [ ! -f "pubspec.yaml" ]; then
  echo "Ce n'est pas un projet Flutter."
  exit 1
fi

# Vérifie si le dossier Android existe
if [ ! -d "android" ]; then
  echo "Le dossier 'android' n'existe pas."
  exit 1
fi

# Naviguer dans le dossier Android
cd android

# Mise à jour de Gradle Wrapper
if [ -n "$DESIRED_GRADLE_VERSION" ]; then
  sed -i "s/gradle-.*-all.zip/gradle-${DESIRED_GRADLE_VERSION}-all.zip/" gradle/wrapper/gradle-wrapper.properties
fi

# Mise à jour de la version Java
if [ -n "$DESIRED_JAVA_VERSION" ]; then
  sed -i "s/JavaVersion.VERSION_[0-9_]*/JavaVersion.VERSION_${DESIRED_JAVA_VERSION}/" app/build.gradle
fi

# Mise à jour de la version NDK
if [ -n "$DESIRED_NDK_VERSION" ]; then
  sed -i "s/ndkVersion = .*/ndkVersion = \"${DESIRED_NDK_VERSION}\"/" app/build.gradle
fi

# Mise à jour de la version minSdk
if [ -n "$DESIRED_MIN_SDK_VERSION" ]; then
  sed -i "s/minSdkVersion .*/minSdkVersion ${DESIRED_MIN_SDK_VERSION}/" app/build.gradle
fi

# Mise à jour de la version targetSdk
if [ -n "$DESIRED_TARGET_SDK" ]; then
  sed -i "s/targetSdkVersion .*/targetSdkVersion ${DESIRED_TARGET_SDK}/" app/build.gradle
fi

# Mise à jour de la version com.android.application
if [ -n "$DESIRED_ANDROID_APPLICATION_VERSION" ]; then
  sed -i "s/id \"com.android.application\" version \".*\"/id \"com.android.application\" version \"${DESIRED_ANDROID_APPLICATION_VERSION}\"/" settings.gradle
fi

echo "Mise à jour du projet Android terminée. Exécute 'git diff' pour voir les changements ou 'git reset --hard' pour les annuler."
