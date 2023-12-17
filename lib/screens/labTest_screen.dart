import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/data/dummyData.dart';
import 'package:medical_app/providers/custom_functions.dart';
import 'package:medical_app/providers/myCart_provider.dart';
import 'package:medical_app/screens/myCart_screen.dart';
import 'package:medical_app/widgets/custom_test_widget.dart';

class LabTestScreen extends ConsumerWidget {
  const LabTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    ref.watch(myCartProvider);
    int totalItems = ref.watch(myCartProvider.notifier).totalItems;
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text('Logo', style: theme.textTheme.displayMedium),
          centerTitle: true,
          actions: [
            if (totalItems > 0)
              Container(
                alignment: Alignment.center,
                height: 18,
                width: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff16C2D5),
                ),
                child: Text('$totalItems',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: theme.colorScheme.primary)),
              ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: theme.colorScheme.primary,
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const MyCartScreen(),
                ));
              },
            ),
          ]),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Text('Popular Lab tests',
                    style: theme.textTheme.displayMedium!
                        .copyWith(color: theme.colorScheme.primary)),
                const Spacer(),
                Row(
                  children: [
                    TextButton(
                        onPressed: showToast,
                        child: Text('View More',
                            style: theme.textTheme.bodyLarge!.copyWith(
                                color: theme.colorScheme.primary,
                                decoration: TextDecoration.underline,
                                decorationColor: theme.colorScheme.primary))),
                    Icon(Icons.arrow_forward,
                        size: 15, color: theme.colorScheme.primary),
                  ],
                )
              ],
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(
                  dummyTest.length,
                  (index) =>
                      CustomTestWidget(theme: theme, test: dummyTest[index])),
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text('Under Development',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )),
                  Icon(Icons.arrow_downward,
                      size: 30, color: Theme.of(context).colorScheme.primary),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
