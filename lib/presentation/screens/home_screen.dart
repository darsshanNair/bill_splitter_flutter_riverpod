import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bill_splitter/core/utilities/app_strings.dart';
import 'package:bill_splitter/core/utilities/constants.dart';
import 'package:bill_splitter/presentation/providers/bill_split_provider.dart';
import 'package:bill_splitter/presentation/components/bill_amount_input.dart';
import 'package:bill_splitter/presentation/components/people_selector.dart';
import 'package:bill_splitter/presentation/components/result_card.dart';
import 'package:bill_splitter/presentation/components/tip_selector.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFormValid = ref.watch(isFormValidProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.homeTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Bill Amount Input
              // const BillAmountInput(),
              // const SizedBox(height: AppConstants.paddingLarge),

              // // People Selector
              // const PeopleSelector(),
              // const SizedBox(height: AppConstants.paddingLarge),

              // // Tip Selector
              // const TipSelector(),
              // const SizedBox(height: AppConstants.paddingLarge),

              // // Reset Button
              // if (isFormValid)
              //   TextButton.icon(
              //     onPressed: () => _resetForm(ref),
              //     icon: const Icon(Icons.refresh),
              //     label: const Text(AppStrings.resetButton),
              //   ),

              // const SizedBox(height: AppConstants.paddingMedium),

              // // Results Card
              // const ResultCard(),

              // const SizedBox(height: AppConstants.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }

  void _resetForm(WidgetRef ref) {
    ref.read(billAmountProvider.notifier).state = 0.0;
    ref.read(numberOfPeopleProvider.notifier).state =
        AppConstants.defaultPeople;
    ref.read(tipPercentageProvider.notifier).state =
        AppConstants.defaultTipPercentage;
  }
}
