# Learnify  🎓

> Plateforme mobile intelligente d'assistance aux études et de révision, propulsée par Flutter, l'architecture BLoC et Google Gemini AI.

---

## 📌 Présentation du Projet

**Learnify** est une application mobile cross-platform conçue pour accompagner les étudiants et les enseignants dans l'apprentissage quotidien. Grâce à l'intégration de l'intelligence artificielle (**Google Gemini**), l'application automatise la génération de synthèses de cours, propose des quiz adaptatifs et permet le suivi des scores et de la progression académique.

### Fonctionnalités Clés

- 🔐 **Authentification & Gestion des Rôles** : Inscription, connexion sécurisée par JWT, gestion multi-rôles (**Étudiant** et **Enseignant**) avec redirection personnalisée.
- 🤖 **Assistance IA (Gemini 2.5 Flash)** : Résumés automatiques de cours, génération de questions interactives et synthèses pédagogiques.
- 🎯 **Module Quiz & Évaluations** :
  - Parcours de quiz chronométrés avec gestion de timer dynamique.
  - Calcul du score en temps réel, animations festives (Confetti, Lottie) et enregistrement des résultats.
  - Outil enseignant de création de questions et réponses (QCM).
- 📊 **Tableaux de bord dédiés** :
  - **Espace Étudiant** : Suivi des matières, scores récents, révisions recommandées.
  - **Espace Enseignant** : Gestion des classes, création d'exercices et suivi des matières.
- 🎨 **Expérience Utilisateur Moderne** : Thème dynamique (Light / Dark mode), mise à l'échelle responsive (`flutter_screenutil`), animations Lottie, skeleton loaders (Shimmer).

---

## 🏗️ Architecture Technique

L'application repose sur les principes de la **Clean Architecture** couplée au pattern d'état **BLoC / Cubit** :

```text
lib/
├── core/                         # Utilitaires transverses
│   ├── services/
│   │   ├── ai/                   # Intégration Google Generative AI (Gemini)
│   │   ├── network/              # Configuration Dio, Intercepteurs JWT, Service Locator
│   │   └── presentation/         # Écrans d'initialisation et splashscreen
│   ├── themes/                   # Définitions des thèmes Light & Dark, Cubit de thème
│   └── widgets/                  # Composants UI réutilisables (shimmer, animations)
├── features/                     # Modules fonctionnels découpés par domaine
│   ├── auth/                     # Authentification, profil utilisateur, gestion des tokens
│   ├── courses/                  # Gestion des supports de cours et vidéos
│   ├── level/                    # Niveaux académiques
│   ├── onboarding/               # Parcours de bienvenue interactif
│   ├── quiz/                     # Moteur de quiz, questions, réponses et scores
│   ├── search/                   # Recherche transversale de matières et contenus
│   ├── student/ & students/      # Espace étudiant, tableau de bord, progression
│   ├── subject/                  # Matières et programmes d'études
│   └── teachers/                 # Espace enseignant, gestion des classes
└── router/                       # Routage déclaratif type-safe via AutoRoute
```

### Stack Technique & Dépendances

| Catégorie | Outil / Librairie | Rôle |
| :--- | :--- | :--- |
| **Framework** | Flutter 3.x / Dart 3.5+ | Développement mobile multiplateforme (Android, iOS) |
| **State Management** | `flutter_bloc` (^9.1), `get_it` (^9.2) | Gestion réactive des états et injection de dépendances |
| **Networking** | `dio` (^5.7), `token_interceptor` | Client HTTP REST avec injection automatique du token Bearer |
| **Intelligence Artificielle**| `google_generative_ai` (^0.4) | Modèle `gemini-2.5-flash` pour la synthèse et génération |
| **Navigation** | `auto_route` (^11.1) | Navigation déclarative basée sur la génération de code |
| **UI & Animations** | `flutter_screenutil`, `lottie`, `confetti`, `shimmer` | Rendu responsive et micro-interactions immersives |
| **Stockage Local** | `shared_preferences` (^2.3) | Persistance du token d'accès et préférences utilisateur |
| **Configuration** | `flutter_dotenv` (^6.0) | Gestion sécurisée des variables d'environnement |

---

## 🚀 Installation et Démarrage

### Prérequis

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `>= 3.5.3`)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio ou Xcode pour l'émulateur / build natif
- Clé d'API Google Gemini ([Google AI Studio](https://aistudio.google.com/))
- Instance active du backend [LearnifyBackend](https://github.com/Hcarmelle7/LearnifyBackend)

### 1. Cloner le dépôt

```bash
git clone https://github.com/Hcarmelle7/Learnify.git
cd Learnify
```

### 2. Configurer l'environnement (`.env`)

Créez le fichier `assets/.env` à la racine des assets :

```env
# Clé d'accès à l'API Google Gemini
GEMINI_API_KEY=votre_cle_gemini_ici

# URL de l'API backend Learnify
API_BASE_URL=http://localhost:3000/api
```

> ⚠️ **Sécurité** : Ne committez jamais le fichier `assets/.env` dans Git. Un modèle `assets/.env.example` est fourni.

### 3. Installer les dépendances

```bash
flutter pub get
```

### 4. Générer le code AutoRoute

Le projet utilise `auto_route_generator`. Lancez la génération de code pour synchroniser le routeur :

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Exécuter l'application

```bash
# Lancement sur émulateur ou appareil connecté
flutter run
```

---

## 🧪 Tests

Pour exécuter la suite de tests unitaires et widgets :

```bash
flutter test
```

---

## 🛣️ Roadmap & Évolutions

- [ ] Connecter dynamiquement l'URL de l'API via variable d'environnement (`API_BASE_URL`).
- [ ] Finaliser l'écran de génération de résumés et de quiz interactifs via Gemini dans l'interface utilisateur.
- [ ] Compléter le module `features/courses` (fichiers vides actuels).
- [ ] Uniformiser le nom du package natif (`com.example.mystudy` vers un bundle ID officiel).
- [ ] Mettre en place un intercepteur d'erreurs HTTP 401 pour déconnexion automatique en cas de token expiré.
