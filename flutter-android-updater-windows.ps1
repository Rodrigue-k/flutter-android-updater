# flutter-android-updater.ps1
# Met à jour Gradle, Java et d'autres paramètres Android dans un projet Flutter

# Versions souhaitées
$VERSION_GRADLE_DESIREE = "8.9"
$VERSION_JAVA_DESIREE = "17"
$VERSION_NDK_DESIREE = "27.0.12077973"
$VERSION_MIN_SDK_DESIREE = "24"
$VERSION_TARGET_SDK_DESIREE = "34"
$VERSION_APPLICATION_ANDROID_DESIREE = "8.7.2"

# Vérifie si c'est un projet Flutter
if (-not (Test-Path "pubspec.yaml")) {
    Write-Host "Ce n'est pas un projet Flutter."
    exit 1
}

# Vérifie si le dossier Android existe
if (-not (Test-Path "android")) {
    Write-Host "Le dossier Android n'existe pas."
    exit 1
}

# Se déplacer dans le dossier Android
Set-Location -Path "android"

# Met à jour la version de Gradle
if ($VERSION_GRADLE_DESIREE) {
    $fichierGradleWrapper = "gradle/wrapper/gradle-wrapper.properties"
    if (Test-Path $fichierGradleWrapper) {
        (Get-Content $fichierGradleWrapper) -replace "gradle-.*-all.zip", "gradle-$VERSION_GRADLE_DESIREE-all.zip" | Set-Content $fichierGradleWrapper
        Write-Host "Version de Gradle mise à jour vers $VERSION_GRADLE_DESIREE."
    } else {
        Write-Host "Le fichier wrapper Gradle est introuvable."
    }
}

# Met à jour la version de Java
if ($VERSION_JAVA_DESIREE) {
    $fichierBuildGradle = "app/build.gradle"
    if (Test-Path $fichierBuildGradle) {
        (Get-Content $fichierBuildGradle) -replace "JavaVersion.VERSION_[0-9_]*", "JavaVersion.VERSION_$VERSION_JAVA_DESIREE" | Set-Content $fichierBuildGradle
        Write-Host "Version de Java mise à jour vers $VERSION_JAVA_DESIREE."
    } else {
        Write-Host "Le fichier app/build.gradle est introuvable."
    }
}

# Met à jour la version NDK
if ($VERSION_NDK_DESIREE) {
    if (Test-Path $fichierBuildGradle) {
        (Get-Content $fichierBuildGradle) -replace "ndkVersion = .*", "ndkVersion = '$VERSION_NDK_DESIREE'" | Set-Content $fichierBuildGradle
        Write-Host "Version NDK mise à jour vers $VERSION_NDK_DESIREE."
    } else {
        Write-Host "Le fichier app/build.gradle est introuvable."
    }
}

# Met à jour la version minSdk
if ($VERSION_MIN_SDK_DESIREE) {
    if (Test-Path $fichierBuildGradle) {
        (Get-Content $fichierBuildGradle) -replace "minSdk = .*", "minSdk = $VERSION_MIN_SDK_DESIREE" | Set-Content $fichierBuildGradle
        Write-Host "Version minSdk mise à jour vers $VERSION_MIN_SDK_DESIREE."
    } else {
        Write-Host "Le fichier app/build.gradle est introuvable."
    }
}

# Met à jour la version targetSdk
if ($VERSION_TARGET_SDK_DESIREE) {
    if (Test-Path $fichierBuildGradle) {
        (Get-Content $fichierBuildGradle) -replace "targetSdk = .*", "targetSdk = $VERSION_TARGET_SDK_DESIREE" | Set-Content $fichierBuildGradle
        Write-Host "Version targetSdk mise à jour vers $VERSION_TARGET_SDK_DESIREE."
    } else {
        Write-Host "Le fichier app/build.gradle est introuvable."
    }
}

# Met à jour la version du plugin com.android.application
if ($VERSION_APPLICATION_ANDROID_DESIREE) {
    $fichierSettingsGradle = "settings.gradle"
    if (Test-Path $fichierSettingsGradle) {
        (Get-Content $fichierSettingsGradle) -replace 'id "com.android.application" version ".*" apply false', 'id "com.android.application" version "' + $VERSION_APPLICATION_ANDROID_DESIREE + '" apply false' | Set-Content $fichierSettingsGradle
        Write-Host "Version du plugin Android mise à jour vers $VERSION_APPLICATION_ANDROID_DESIREE."
    } else {
        Write-Host "Le fichier settings.gradle est introuvable."
    }
}

Write-Host "Projet Android Flutter mis à jour. Exécutez 'git diff' pour voir les changements ou 'git reset --hard' pour les annuler."
