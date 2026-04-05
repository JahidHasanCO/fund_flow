# FundFlow - Clean Architecture Flutter App

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── config/                   # Configuration
│   └── router_config.dart   # GoRouter configuration
├── core/                     # Core functionality
│   ├── constants/            # App constants
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── app_dimensions.dart
│   │   └── constants.dart
│   ├── theme/                # App theme
│   │   └── app_theme.dart
│   └── utils/                # Utilities
│       ├── extensions.dart
│       ├── validators.dart
│       └── utils.dart
├── shared/                   # Shared components
│   └── widgets/              # Reusable widgets
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       ├── auth_header.dart
│       ├── terms_footer.dart
│       ├── auth_progress_bar.dart
│       └── widgets.dart
└── features/                 # Feature modules
    └── auth/                 # Authentication feature
        ├── data/             # Data layer (models, services)
        ├── domain/           # Domain layer (entities, use cases)
        └── presentation/     # Presentation layer
            ├── bloc/         # BLoC for state management
            │   ├── auth_bloc.dart
            │   ├── auth_event.dart
            │   ├── auth_state.dart
            │   └── bloc.dart
            ├── screens/      # UI Screens
            │   ├── phone_verification_screen.dart
            │   ├── otp_verification_screen.dart
            │   ├── register_screen.dart
            │   ├── home_screen.dart
            │   └── screens.dart
            └── widgets/      # Feature-specific widgets
```

## Architecture Layers

### Core
- **Constants**: Centralized app-wide constants (colors, strings, dimensions)
- **Theme**: Unified theme configuration for dark mode
- **Utils**: Common utilities, validators, and extensions

### Shared
- **Widgets**: Reusable UI components (buttons, text fields, headers)

### Features (Authentication)
- **Data**: API calls, local storage, models
- **Domain**: Business logic, use cases, entities
- **Presentation**: UI layer with BLoC state management

## Key Technologies
- **flutter_bloc**: State management
- **go_router**: Navigation and routing
- **equatable**: Value equality for BLoC events/states

## Authentication Flow
1. User enters phone number → Phone verification screen
2. OTP sent → User verifies OTP
3. User sets password → Registration screen
4. Account created → Redirected to home

## Development Guidelines
- No comments in code
- Constants are globally accessible
- Widgets are reusable and feature-agnostic
- BLoC handles all business logic
- Clean separation of concerns
