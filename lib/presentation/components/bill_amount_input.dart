import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bill_splitter/core/utilities/app_strings.dart';
import 'package:bill_splitter/core/utilities/constants.dart';
import 'package:bill_splitter/presentation/providers/bill_split_provider.dart';

class BillAmountInput extends ConsumerWidget {
  const BillAmountInput({super.key});

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final textTheme = Theme.of(context).textTheme;

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         AppStrings.billAmountLabel,
  //         style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: AppConstants.paddingSmall),
  //       TextField(
  //         keyboardType: const TextInputType.numberWithOptions(decimal: true),
  //         inputFormatters: [
  //           FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
  //         ],
  //         decoration: const InputDecoration(
  //           hintText: AppStrings.billAmountHint,
  //           prefixIcon: Icon(Icons.attach_money),
  //           suffixText: 'RM',
  //         ),
  //         onChanged: (value) {
  //           final amount = double.tryParse(value) ?? 0.0;
  //           ref.read(billAmountProvider.notifier).state = amount;
  //         },
  //       ),
  //     ],
  //   );
  // }
}
