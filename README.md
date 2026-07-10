# 🛍️ Syrian Cart — Flutter E-Commerce UI

A polished, production-grade **Flutter e-commerce front-end** built with a clean feature-based architecture, custom animations, and a fully custom design system. Syrian Cart demonstrates real-world mobile engineering practices: modular code organization, reusable UI components, smooth navigation transitions, and thoughtful UX details — all without relying on a single third-party UI package.

This project is designed to showcase engineering discipline as much as visual polish: every screen, widget, and route is deliberately structured for readability, scalability, and maintainability.

---

## ✨ Overview

Syrian Cart is a shopping app interface covering the full customer journey — from an animated splash screen, through product browsing and filtering, to product details, cart management, and checkout. It is built entirely with native Flutter widgets, a custom theming layer, and a hand-rolled navigation system, making it an excellent reference for clean Flutter architecture.

---

## 🚀 Key Features

- **Animated Splash Screen** — A custom multi-stage entrance animation (logo scale/rotation with overshoot easing, sliding/fading text, an expanding divider, and pulsing loading dots) built entirely with `AnimationController`, `TweenSequence`, and `CurvedAnimation` — no animation packages used.
- **Custom Bottom Navigation** — A pill-shaped, animated bottom nav bar with icon highlighting and selection indicators, driving a four-tab layout (Home, Favorites, Cart, Profile).
- **Home & Product Discovery**
  - Horizontally scrollable category list
  - Search input with a notification bell and unread-badge indicator
  - Bottom-sheet notification center listing recent activity
  - Responsive two-column product grid
- **Product Details Screen**
  - Collapsing `SliverAppBar` with a stretch/zoom hero image transition
  - Favorite toggle with animated icon state
  - Quantity stepper synced to a live price total
  - "Add to Cart" bar with contextual snackbar feedback
- **Cart Management**
  - Editable cart with per-item quantity steppers
  - Live-calculated order total
  - Empty-state UI for an empty cart
- **Favorites**
  - Grid view of saved products with a dedicated empty state
- **Profile**
  - Grouped settings/orders sections built from a reusable tile component
  - Guest-user fallback state
  - Confirmation dialog before logout, with redirect to the login flow
- **Custom Routing Layer** — A centralized `AppRouter` using `onGenerateRoute`, complete with:
  - Type-safe argument passing (e.g., `ProductModel` required for the details route)
  - Custom fade + slide page transitions on every navigation
  - A dedicated fallback "page not found" error route for unmatched paths
- **Reusable Design System** — Centralized color palette (`AppColors`) and a full typographic scale (`AppTextStyles`) covering display, headline, title, body, label, and semantic (price, success, warning, error) text styles, consumed consistently across every screen.

---

## 🧱 Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | Native `StatefulWidget` / `setState` |
| Navigation | Custom `onGenerateRoute` router with typed route arguments |
| Animations | Flutter's core animation APIs (`AnimationController`, `TweenSequence`, `CurvedAnimation`, `Hero`) |
| Styling | Custom design tokens (`AppColors`, `AppTextStyles`) — no external UI kits |
| Architecture Pattern | Feature-first, layered (`data` / `presentation`) structure |

No external state-management or UI packages are used — every interaction, animation, and transition is implemented with Flutter's own SDK, reflecting strong fundamentals in the framework.

---

## 🏗️ Project Architecture

The codebase follows a **feature-first architecture**, where each business capability (auth, home, cart, details, profile, etc.) is self-contained with its own `data` and `presentation` layers:

```
lib/
├── main.dart                     # App entry point
├── app.dart                      # MaterialApp root, theme & route wiring
│
├── core/                         # Cross-cutting, app-wide concerns
│   ├── routing/                  # Centralized route table & navigator
│   └── theme/                    # Design tokens: colors & text styles
│
└── feature/                      # One folder per business capability
    ├── splash/
    │   └── presentation/screens/         # Animated splash screen
    ├── auth/
    │   └── presentation/screens/
    │       ├── login/                    # Login screen
    │       └── signup/                   # Signup screen
    ├── layout/
    │   ├── presentation/                 # Bottom-nav shell & screens
    │   └── data/data_source/             # Nav icon asset references
    ├── home/
    │   ├── data/
    │   │   ├── models/                   # ProductModel, CategoryModel
    │   │   └── data_source/              # Static product & category catalogs
    │   └── presentation/
    │       ├── screens/                  # HomeScreen
    │       └── widgets/                  # AppBar, search, categories, product grid/card
    ├── details/
    │   └── presentation/widgets/         # Sliver app bar, details body, add-to-cart bar
    ├── cart/
    │   └── presentation/screens/         # Cart screen & cart item model
    ├── fav/
    │   └── presentation/screens/         # Favorites grid screen
    ├── profile/
    │   ├── data/models/                  # UserModel
    │   └── presentation/                 # Profile screen, header, menu tiles
    └── checkout/
        └── presentation/screens/         # Checkout screen (scaffolded)
```

Each feature separates **data** (models and static data sources) from **presentation** (screens and widgets), keeping UI code decoupled from the data it renders — a pattern that scales cleanly toward a real backend integration.

---

## ⚙️ How It Works

1. **App bootstraps** in `main.dart`, launching `App` (`app.dart`), which configures the `MaterialApp` with a global font, an initial route, and a custom route generator.
2. **`AppRouter.generateRoute`** intercepts every navigation call, matches the route name against `AppRoutes`, validates any required arguments (e.g., a `ProductModel` for the details page), and wraps each destination in a custom fade/slide `PageRouteBuilder`. Unknown routes resolve to a graceful error screen instead of crashing.
3. **Splash → Layout**: The animated splash screen runs a timed, multi-phase animation sequence, then automatically navigates into `LayoutScreen`, which owns the bottom navigation state and swaps between `HomeScreen`, `FavScreen`, `CartScreen`, and `ProfileScreen`.
4. **Browsing**: `HomeScreen` renders categories and a static product catalog (`ProductData`) through a responsive grid. Tapping a product pushes `DetailsScreen`, passing the selected `ProductModel` as a typed route argument.
5. **Product Details**: Users can adjust quantity, toggle favorite status, and add the item to their cart — all managed via local widget state, with a snackbar confirming the action.
6. **Cart & Checkout**: `CartScreen` computes the running total from item price × quantity and exposes a checkout call-to-action; `CheckoutScreen` is scaffolded as the next step in the flow.
7. **Profile**: Displays user info (with a guest fallback), grouped account/settings tiles, and a confirmation-gated logout that returns the user to the login screen.

All data in this version — products, categories, and notifications — is served from static in-memory sources, making the UI layer fully functional and demo-ready while remaining straightforward to wire up to a real API.

---

## 🛠️ Installation & Setup

**Prerequisites**
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- A configured Android/iOS emulator or physical device

**Steps**

```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/syrian-cart.git
cd syrian-cart

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

> Ensure the `assets/images/` directory referenced in the code (product images, category icons, nav icons) is present and declared in `pubspec.yaml` before running.

---

## 📸 Screenshots

| Splash | Home | Product Details | Cart |
|---|---|---|---|
| _placeholder_ | _placeholder_ | _placeholder_ | _placeholder_ |

> Add screenshots or screen recordings here (e.g., `docs/screenshots/`) to showcase the animated splash, product grid, details transition, and cart flow.

---

## 🔭 Future Improvements

Based on the current structure, natural next steps include:

- Wiring `LoginScreen`, `SignupScreen`, and `CheckoutScreen` to real logic (currently scaffolded placeholders)
- Replacing static data sources (`ProductData`, `categories`) with a live API/backend integration
- Introducing a dedicated state-management solution (e.g., Provider, Riverpod, or Bloc) as cart/favorites state grows beyond local widget state
- Persisting cart and favorites data locally (e.g., via `shared_preferences` or a local database)
- Adding form validation and authentication flow to the login/signup screens
- Expanding automated widget/unit test coverage across features

---

## 👔 A Note for Recruiters & Hiring Managers

This project reflects hands-on, senior-level Flutter engineering: a deliberate feature-first architecture, a fully custom animation and navigation layer built without third-party dependencies, and a consistent, reusable design system applied across every screen. It demonstrates not just the ability to build attractive UI, but the discipline to structure a codebase that a team can scale, test, and maintain over time.

If you're evaluating Flutter engineering talent, this codebase is a representative sample of production-oriented thinking — clean separation of concerns, typed navigation, and attention to UX detail throughout.
