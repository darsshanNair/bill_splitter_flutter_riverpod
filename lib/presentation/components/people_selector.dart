import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bill_splitter/core/utilities/app_strings.dart';
import 'package:bill_splitter/core/utilities/constants.dart';
import 'package:bill_splitter/presentation/providers/bill_split_provider.dart';

class PeopleSelector extends ConsumerWidget {
  const PeopleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfPeople = ref.watch(numberOfPeopleProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.numberOfPeopleLabel,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConstants.paddingMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Decrease button
            IconButton.filled(
              onPressed: numberOfPeople > AppConstants.minPeople
                  ? () {
                      ref.read(numberOfPeopleProvider.notifier).state--;
                    }
                  : null,
              icon: const Icon(Icons.remove),
              iconSize: AppConstants.iconSizeMedium,
            ),

            // Display number
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
                vertical: AppConstants.paddingMedium,
              ),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusMedium,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, color: colorScheme.onPrimaryContainer),
                  const SizedBox(width: AppConstants.paddingSmall),
                  Text(
                    '$numberOfPeople',
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),

            // Increase button
            IconButton.filled(
              onPressed: numberOfPeople < AppConstants.maxPeople
                  ? () {
                      ref.read(numberOfPeopleProvider.notifier).state++;
                    }
                  : null,
              icon: const Icon(Icons.add),
              iconSize: AppConstants.iconSizeMedium,
            ),
          ],
        ),
      ],
    );
  }
}
