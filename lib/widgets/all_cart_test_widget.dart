import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/model/test.dart';
import 'package:medical_app/providers/myCart_provider.dart';

class AllCartTestWidget extends ConsumerStatefulWidget {
  const AllCartTestWidget({
    super.key,
  });

  @override
  ConsumerState<AllCartTestWidget> createState() => _AllCartTestWidgetState();
}

class _AllCartTestWidgetState extends ConsumerState<AllCartTestWidget> {
  @override
  Widget build(BuildContext context) {
    ref.watch(myCartProvider);
    List<Test> cartItems = ref.read(myCartProvider.notifier).cartList;
    final theme = Theme.of(context);
    return Column(
      children: List.generate(
          cartItems.length,
          (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Text(
                        'Pathology tests',
                        style: theme.textTheme.displaySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(cartItems[index].testName,
                                  style: theme.textTheme.displaySmall),
                              const Spacer(),
                              Text(
                                '₹${cartItems[index].testDiscountPrice}/-',
                                style: theme.textTheme.displaySmall!
                                    .copyWith(color: const Color(0xff16C2D5)),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${cartItems[index].testNormalPrice}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                          const SizedBox(height: 10),
                          OutlinedButton.icon(
                              onPressed: () {
                                ref
                                    .read(myCartProvider.notifier)
                                    .removeTest(cartItems[index]);
                              },
                              icon: const Icon(Icons.delete_outlined),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: theme.colorScheme.primary,
                                side: BorderSide(
                                    color: theme.colorScheme.primary, width: 2),
                              ),
                              label: Text('Remove',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold))),
                          OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.file_upload_outlined),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: theme.colorScheme.primary,
                                side: BorderSide(
                                    color: theme.colorScheme.primary, width: 2),
                              ),
                              label: Text('Upload Prescription (optional)',
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
