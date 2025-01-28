Ces scripts sont adaptés à partir du script macOS de [Andrea Bizzotto](https://gist.github.com/bizz84/605e2ca2088cb4acb7a076ca993f41cd)
# Flutter Android Updater

Ce dépôt contient des scripts permettant de mettre à jour les paramètres Android dans un projet Flutter. Les scripts sont adaptés pour **Linux**, **Windows**, et **MacOS**, afin de garantir une mise à jour facile et efficace de votre environnement de développement Android.

## Description

Ces scripts automatisent la mise à jour des configurations Android essentielles dans vos projets Flutter. Ils permettent de maintenir votre environnement de développement à jour avec les dernières versions recommandées des outils Android.

## Fonctionnalités

Les scripts permettent la mise à jour automatique des éléments suivants :

- Version de Gradle
- Version de Java
- Version du NDK (Native Development Kit)
- Versions de minSdk et targetSdk
- Version de l'application Android

## Scripts Disponibles

- **Linux** : `flutter-android-updater.sh`
- **Windows** : `flutter-android-updater.ps1`
- **MacOS** : Script disponible via le lien du créateur original (voir section Credits)

## Utilisation

### Linux
1. Téléchargez le fichier [`flutter-android-updater.sh`](flutter-android-updater-windows.ps1) depuis ce dépôt
2. Rendez le script exécutable :
   ```bash
   chmod +x flutter-android-updater.sh
   ```
3. Exécutez le script dans votre projet Flutter :
   ```bash
   ./flutter-android-updater.sh
   ```

### Windows
1. Téléchargez le fichier `flutter-android-updater.ps1` depuis ce dépôt
2. Ouvrez PowerShell en tant qu'administrateur
3. Activez l'exécution des scripts si nécessaire :
   ```powershell
   Set-ExecutionPolicy RemoteSigned
   ```
4. Exécutez le script dans votre projet Flutter :
   ```powershell
   .\flutter-android-updater.ps1
   ```

### MacOS
Pour les utilisateurs MacOS, nous vous recommandons d'utiliser le script original créé par Andrea Bizzotto. Vous pouvez trouver ce script sur son [Gist](https://gist.github.com/bizz84/605e2ca2088cb4acb7a076ca993f41cd).

Le script pour MacOS offre les mêmes fonctionnalités que nos versions Linux et Windows. Vous pouvez l'adapter selon vos besoins en modifiant les versions des différents composants.

## Personnalisation

Vous pouvez modifier les versions cibles dans les scripts selon vos besoins :

- `GRADLE_VERSION`
- `JAVA_VERSION`
- `NDK_VERSION`
- `MIN_SDK_VERSION`
- `TARGET_SDK_VERSION`
- `COMPILE_SDK_VERSION`

## Avertissements

- Faites toujours une sauvegarde de votre projet avant d'exécuter les scripts
- Vérifiez la compatibilité des versions que vous souhaitez utiliser
- Testez votre application après la mise à jour

## Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche pour votre fonctionnalité
3. Commiter vos changements
4. Pousser vers la branche
5. Ouvrir une Pull Request

## Credits

- Version MacOS : Script original créé par [Andrea Bizzotto](https://github.com/bizz84)
  - [Lien vers le script original](https://gist.github.com/bizz84/605e2ca2088cb4acb7a076ca993f41cd)
  - Nous remercions Andrea pour son excellent travail sur la version MacOS

## Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.
