import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:my_pet/controllers/eating_controller.dart';
import 'package:my_pet/routes/app_pages.dart';
import 'package:my_pet/widgets/appbar.dart';

class EatingPage extends StatelessWidget {
  EatingPage({Key? key}) : super(key: key);
  final controller = EatingController.to;

  @override
  Widget build(BuildContext context) {
    Widget _dateTimeSelector(
        String text, RxString field, void Function() onPressed) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Text(field.value)),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(text),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: DefaultAppbar(routeName: ROUTES.eating,),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _dateTimeSelector(
              'Select Date',
              controller.date,
              () {
                DateTime now = DateTime.now();
                showDatePicker(
                  firstDate: DateTime(now.year, 1, 1),
                  lastDate: DateTime(now.year + 1, 12, 31),
                  initialDate: now,
                  context: context,
                ).then(
                  (value) {
                    if (value != null) {
                      controller
                          .setDate('${value.year}-${value.month}-${value.day}');
                    }
                  },
                );
              },
            ),
            _dateTimeSelector('Select Time', controller.time, () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then(
                (value) {
                  if (value != null) {
                    controller.setTime('${value.hour}:${value.minute.toString().padLeft(2, '0')}');
                  }
                },
              );
            }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Food',
                ),
                onChanged: (value) {
                  controller.setFood(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    controller.submit();
                  },),
            ),
          ],
        ),
      ),
    );
  }
}
