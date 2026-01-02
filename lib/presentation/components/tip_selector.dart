import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bill_splitter/core/utilities/app_strings.dart';
import 'package:bill_splitter/core/utilities/constants.dart';
import 'package:bill_splitter/presentation/providers/bill_split_provider.dart';

class TipSelector extends ConsumerWidget {
  const TipSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTip = ref.watch(tipPercentageProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.tipPercentageLabel,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConstants.paddingMedium),
        Wrap(
          spacing: AppConstants.paddingSmall,
          runSpacing: AppConstants.paddingSmall,
          children: AppConstants.tipPercentages.map((tip) {
            final isSelected = tip == selectedTip;

            return ChoiceChip(
              label: Text('$tip%'),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  ref.read(tipPercentageProvider.notifier).state = tip;
                }
              },
              selectedColor: colorScheme.primary,
              labelStyle: TextStyle(
                color:
                    isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              showCheckmark: false,
            );
          }).toList(),
        ),
      ],
    );
  }
}
