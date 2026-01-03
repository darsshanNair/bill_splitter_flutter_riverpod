import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bill_splitter/core/utilities/app_strings.dart';
import 'package:bill_splitter/core/utilities/constants.dart';
import 'package:bill_splitter/core/helpers/currency_formatter.dart';
import 'package:bill_splitter/presentation/providers/bill_split_provider.dart';

class ResultCard extends ConsumerWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billSplit = ref.watch(billSplitProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (billSplit == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            children: [
              Icon(
                Icons.receipt_long,
                size: 64,
                color: colorScheme.outline.withValues(alpha: 80),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Text(
                AppStrings.emptyStateMessage,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.outline,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingLarge),
        child: Column(
          children: [
            // Total Per Person - Main highlight
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(
                  AppConstants.borderRadiusMedium,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.totalPerPerson,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingSmall),
                  Text(
                    CurrencyFormatter.format(billSplit.amountPerPerson),
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.paddingLarge),

            // Bill Breakdown
            Text(
              AppStrings.billBreakdown,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            const Divider(),

            // Breakdown Items
            _buildBreakdownRow(
              context,
              AppStrings.originalBill,
              CurrencyFormatter.format(billSplit.billAmount),
              Icons.receipt,
            ),
            const SizedBox(height: AppConstants.paddingSmall),

            _buildBreakdownRow(
              context,
              '${AppStrings.tipAmount} (${billSplit.tipPercentage}%)',
              CurrencyFormatter.format(billSplit.tipAmount),
              Icons.volunteer_activism,
            ),
            const SizedBox(height: AppConstants.paddingSmall),

            const Divider(),

            _buildBreakdownRow(
              context,
              AppStrings.totalWithTip,
              CurrencyFormatter.format(billSplit.totalWithTip),
              Icons.payments,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreakdownRow(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    bool isTotal = false,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: AppConstants.iconSizeSmall,
          color: isTotal ? colorScheme.primary : colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: AppConstants.paddingSmall),
        Expanded(
          child: Text(
            label,
            style: isTotal
                ? textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                : textTheme.bodyLarge,
          ),
        ),
        Text(
          value,
          style: isTotal
              ? textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                )
              : textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
