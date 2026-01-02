# Bill Splitter App

A simple Flutter application demonstrating fundamental concepts with **flutter_riverpod** state management.

## 🎯 Learning Objectives

This app is designed to teach beginner developers:

1. **Flutter Project Structure** - Organized folder architecture
2. **State Management** - Using Riverpod providers
3. **Component Architecture** - Reusable widgets
4. **Theming** - Light and dark mode support
5. **Data Models** - Clean data structures
6. **Helper Functions** - Currency formatting utilities

## 📁 Project Structure

```
lib/
├── core/
│   ├── utilities/
│   │   ├── app_strings.dart      # All UI text constants
│   │   └── constants.dart         # App-wide constants
│   ├── helpers/
│   │   └── currency_formatter.dart # Currency formatting utility
│   └── models/
│       └── bill_split_model.dart  # Data model for bill calculations
├── presentation/
│   ├── provider/
│   │   └── bill_split_providers.dart # Riverpod state providers
│   ├── screens/
│   │   └── home_screen.dart       # Main screen
│   ├── components/
│   │   ├── bill_amount_input.dart # Bill amount input widget
│   │   ├── people_selector.dart   # Number of people selector
│   │   ├── tip_selector.dart      # Tip percentage selector
│   │   └── result_card.dart       # Results display card
│   └── theme/
│       ├── light_theme.dart       # Light mode theme
│       ├── dark_theme.dart        # Dark mode theme
│       └── app_theme.dart         # Theme export
└── main.dart                      # App entry point
```

## 🚀 Features

- **Bill Amount Input** - Enter the total bill amount
- **People Selector** - Choose how many people to split the bill between (1-20)
- **Tip Calculator** - Select tip percentage (0%, 10%, 15%, 18%, 20%, 25%)
- **Real-time Calculation** - Automatic calculation as you change inputs
- **Bill Breakdown** - Detailed breakdown of original bill, tip, and totals
- **Theme Support** - Automatic light/dark mode based on system preference
- **Clean UI** - Modern Material Design 3 interface

## 🔧 Setup

1. **Install dependencies:**

   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

## 📚 Key Concepts Demonstrated

### 1. Riverpod State Management

```dart
// State Provider - Holds mutable state
final billAmountProvider = StateProvider<double>((ref) => 0.0);

// Provider - Computed state based on other providers
final billSplitProvider = Provider<BillSplitModel?>((ref) {
  final billAmount = ref.watch(billAmountProvider);
  // ... computation logic
});
```

### 2. ConsumerWidget

Widgets that need to read providers extend `ConsumerWidget`:

```dart
class BillAmountInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read provider value
    final amount = ref.watch(billAmountProvider);

    // Update provider value
    ref.read(billAmountProvider.notifier).state = newValue;
  }
}
```

### 3. Data Models

Immutable data classes with computed properties:

```dart
class BillSplitModel {
  final double billAmount;
  final int numberOfPeople;

  double get amountPerPerson => totalWithTip / numberOfPeople;
}
```

### 4. Constants Organization

Centralized constants for maintainability:

```dart
class AppConstants {
  static const double paddingMedium = 16.0;
  static const int defaultTipPercentage = 15;
}
```

## 🎓 Teaching Points

When demonstrating this app to beginners, highlight:

1. **Separation of Concerns**

   - UI components in `presentation/`
   - Business logic in `core/`
   - Clear responsibility boundaries

2. **State Management Flow**

   - User input → Provider update → UI rebuild
   - Reactive programming with Riverpod

3. **Reusable Components**

   - Each component is self-contained
   - Easy to test and modify independently

4. **Theming**

   - System-aware light/dark mode
   - Consistent design language

5. **Input Validation**
   - Real-time validation
   - User-friendly error handling

## 🔄 How Data Flows

1. User enters bill amount → `billAmountProvider` updates
2. User selects number of people → `numberOfPeopleProvider` updates
3. User picks tip percentage → `tipPercentageProvider` updates
4. `billSplitProvider` watches all three providers and recomputes
5. `ResultCard` watches `billSplitProvider` and rebuilds with new data

## 💡 Extension Ideas

To practice more Flutter concepts, students can:

- Add history of past calculations
- Implement custom tip percentage input
- Add ability to split bill unevenly
- Create shareable results (share button)
- Add animations to the results display
- Implement currency selection
- Add ability to input tax percentage

## 🛠️ Dependencies

- `flutter_riverpod: ^2.5.1` - State management
- `intl: ^0.19.0` - Currency formatting

## 📝 License

This is a teaching project created for educational purposes.
