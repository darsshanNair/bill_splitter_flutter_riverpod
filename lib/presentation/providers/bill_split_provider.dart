import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/bill_split_model.dart';
import '../../core/utilities/constants.dart';

/// Provider for bill amount
final billAmountProvider = StateProvider<double>((ref) => 0.0);

/// Provider for number of people
// final numberOfPeopleProvider = StateProvider<int>(
//   (ref) => AppConstants.defaultPeople,
// );

/// Provider for tip percentage
// final tipPercentageProvider = StateProvider<int>(
//   (ref) => AppConstants.defaultTipPercentage,
// );

/// Provider that computes the bill split calculation
/// This is a computed provider that depends on the three state providers above
// final billSplitProvider = Provider<BillSplitModel?>((ref) {
//   final billAmount = ref.watch(billAmountProvider);
//   final numberOfPeople = ref.watch(numberOfPeopleProvider);
//   final tipPercentage = ref.watch(tipPercentageProvider);

  // Return null if bill amount is invalid
  // if (billAmount <= 0) {
  //   return null;
  // }

//   return BillSplitModel(
//     billAmount: billAmount,
//     numberOfPeople: numberOfPeople,
//     tipPercentage: tipPercentage,
//   );
// });

/// Provider for form validation state
// final isFormValidProvider = Provider<bool>((ref) {
//   final billAmount = ref.watch(billAmountProvider);
//   return billAmount > 0;
// });
