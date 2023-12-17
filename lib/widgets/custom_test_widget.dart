import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/model/test.dart';
import 'package:medical_app/providers/myCart_provider.dart';
import 'package:medical_app/providers/custom_functions.dart';

class CustomTestWidget extends ConsumerWidget {
  const CustomTestWidget({super.key, required this.theme, required this.test});

  final ThemeData theme;
  final Test test;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE5E5E5)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 40,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Text(
            test.testName,
            style: theme.textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(test.testDescription, style: theme.textTheme.titleLarge),
                  const Spacer(),
                  SvgPicture.asset('assets/svg/Badge.svg'),
                ],
              ),
              const SizedBox(height: 10),
              Text('Get reports in ${test.testReportTime} ',
                  style: theme.textTheme.titleLarge),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '₹${test.testDiscountPrice}',
                    style: theme.textTheme.headlineSmall!.copyWith(
                        color: theme.colorScheme.primary, fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Text('₹${test.testNormalPrice}',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(decoration: TextDecoration.lineThrough)),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(myCartProvider.notifier).addTest(test);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: theme.colorScheme.primary,
                  ),
                  child: const Text('Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: showToast,
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: theme.colorScheme.primary),
                  ),
                  child: Text('View Details',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                      )),
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
