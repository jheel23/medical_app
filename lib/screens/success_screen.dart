import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/providers/custom_functions.dart';
import 'package:medical_app/providers/myAppointment_provider.dart';

class SuccessScreen extends ConsumerWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(myAppointmentProvider);
    Map<String, dynamic> appointment =
        ref.read(myAppointmentProvider.notifier).appointments;

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xff16C2D5),
              ))
        ],
        title: Text(
          'Success',
          style: theme.textTheme.displayMedium,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset('assets/svg/success.svg'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Lab tests have been scheduled successfully, You will receive a mail of the same.',
            style: theme.textTheme.displayMedium!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text('${dateformatter(appointment['date'])} | ${appointment['time']}',
              style: theme.textTheme.displayMedium!
                  .copyWith(color: Colors.black54))
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text('Back to Home',
                    style: theme.textTheme.displayMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))),
          )),
    );
  }
}
