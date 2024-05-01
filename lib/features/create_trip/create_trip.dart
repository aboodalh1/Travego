import 'package:flutter/material.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/search_text_form/search_text_form_field.dart';
import 'package:travego/core/widgets/top_trip_item/top_trip_item.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../parsonnes_information/personnes_information.dart';

//ignore:must_be_immutable
class CreateTrip extends StatelessWidget {
  CreateTrip({super.key});

  TextEditingController searchController = TextEditingController();
  DateTime dateController = DateUtils.dateOnly(DateTime.now());
  DateTime dateController2 = DateUtils.dateOnly(DateTime.parse('2030-02-01'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(
              context,
              PersonnesInformation(
                startDate: DateFormat.MEd().format(dateController).toString(),
                lastDate: DateFormat.MEd().format(dateController2).toString(),
              ));
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: defaultColor,
      ),
      appBar: AppBar(
        title: const Text('Create trip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchTextField(
              label: 'Search for destination',
              searchController: searchController,
            ),
            const SizedBox(
              height: 12,
            ),
            const TopTripsItem(),
            CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.range,
                    rangeBidirectional: true,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2030-05-15'),
                    currentDate: DateTime.now(),
                    selectedDayHighlightColor: defaultColor),
                value: [dateController2],
                onValueChanged: (dates) {
                  if (dates.length == 2) {
                    dateController = dates[0]!;
                    dateController2 = dates[1]!;
                    print(
                        DateFormat.yMMMEd().format(dateController).toString());
                    print(dateController2.toString());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
