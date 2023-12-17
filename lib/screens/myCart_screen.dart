import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/model/test.dart';
import 'package:medical_app/providers/myAppointment_provider.dart';
import 'package:medical_app/providers/myCart_provider.dart';
import 'package:medical_app/providers/custom_functions.dart';

import 'package:medical_app/screens/bookAppointment_screen.dart';
import 'package:medical_app/screens/success_screen.dart';
import 'package:medical_app/widgets/all_cart_test_widget.dart';

//!-----------------------------------------
enum ReportHardCopy { yes, no }

//!-----------------------------------------
class MyCartScreen extends ConsumerWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(myCartProvider);
    ref.watch(myAppointmentProvider);
    Map<String, dynamic> appointment =
        ref.read(myAppointmentProvider.notifier).appointments;

    List<Test> cartItems = ref.read(myCartProvider.notifier).cartList;
    final theme = Theme.of(context);
    return PopScope(
      canPop: true,
      onPopInvoked: (_) {
        ref.read(myAppointmentProvider.notifier).clearAppointment();
      },
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            'My Cart',
            style: theme.textTheme.displayMedium,
          ),
          actions: const [
            IconButton(
                onPressed: showToast,
                icon: Icon(
                  Icons.more_vert,
                  color: Color(0xff16C2D5),
                ))
          ],
        ),
        body: cartItems.isEmpty
            ? const Center(
                child: Text('No Test selected, try adding some!'),
              )
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order review',
                        style: theme.textTheme.displayMedium!.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const AllCartTestWidget(),
                      const SizedBox(height: 14),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black38)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>
                                        const BookAppointmentScreen(),
                                  ));
                                },
                                icon:
                                    const Icon(Icons.calendar_month_outlined)),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black38)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                    appointment.isEmpty
                                        ? 'Select Date'
                                        : '${dateformatter(appointment['date'])}, ${appointment['time']}',
                                    style: appointment.isEmpty
                                        ? theme.textTheme.bodyLarge!
                                            .copyWith(color: Colors.grey)
                                        : theme.textTheme.bodyLarge!.copyWith(
                                            color: theme.colorScheme.primary,
                                            fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black38)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text('M.R.P Total'),
                                const Spacer(),
                                Text(
                                    '${ref.read(myCartProvider.notifier).totalAmount}')
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('Discount'),
                                const Spacer(),
                                Text(
                                    '${ref.read(myCartProvider.notifier).totalDiscount}')
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Amount to be paid',
                                    style: theme.textTheme.displaySmall!
                                        .copyWith(
                                            color: theme.colorScheme.primary)),
                                Text(
                                    '₹${ref.read(myCartProvider.notifier).totalAmountAfterDiscount}/-',
                                    style: theme.textTheme.displaySmall!
                                        .copyWith(
                                            color: theme.colorScheme.primary))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Text('Total Savings'),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                    '₹${ref.read(myCartProvider.notifier).totalDiscount}/-',
                                    style: theme.textTheme.displaySmall!
                                        .copyWith(
                                            color: theme.colorScheme.primary))
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black38)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio.adaptive(
                                value: ReportHardCopy.yes,
                                groupValue: ReportHardCopy.yes,
                                onChanged: (value) {}),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Hard copy of reports ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      'Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched.\n ₹150 per person',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: theme.textTheme.bodyMedium),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (appointment.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        content: Align(
                          alignment: Alignment.center,
                          child: Text('Please select all the details',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.white)),
                        ),
                      ));
                      return;
                    }
                    Navigator.of(context).pushReplacement(
                        CupertinoModalPopupRoute(
                            builder: (context) => const SuccessScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text('Schedule',
                      style: theme.textTheme.displayMedium!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            )),
      ),
    );
  }
}
