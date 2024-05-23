import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/search_text_form/search_text_form_field.dart';
import 'package:travego/core/widgets/top_trip_item/top_trip_item.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:travego/features/create_trip/parsonnes_information/personnes_cubit/person_cubit.dart';
import 'parsonnes_information/personnes_information.dart';


class CreateTrip extends StatelessWidget {
  const CreateTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonCubit(),
      child: BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<PersonCubit>(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
            navigateTo(context,  PersonnesInformation(
              startDate: DateFormat.MEd().format(cubit.dateController).toString(),
              lastDate: DateFormat.MEd().format(cubit.dateController2).toString(),
            ));
              },
              backgroundColor: defaultColor,
              child: const Icon(Icons.arrow_forward),
            ),
            appBar: AppBar(
              title: Text('Create trip'.tr),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SearchTextField(
                    label: 'Search for destination'.tr,
                    searchController: cubit.searchController,
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
                      value: [cubit.dateController2],
                      onValueChanged: (dates) {
                        if (dates.length == 2) {
                          cubit.dateController = dates[0]!;
                          cubit.dateController2 = dates[1]!;
                          print(DateFormat.yMMMEd()
                              .format(cubit.dateController)
                              .toString());
                          print(cubit.dateController2.toString());
                        }
                      }),
                ],
              ),
            ),
          );

      },
    ),
    );
  }
}


/*
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhYmRhbGxhaGFsaGFyaXN5QGdt
YWlsLmNvbSIsImlhdCI6MTcxNjM2NjIzNCwiZXhwIjoxNzE3ODgxMzMyfQ.O8ps1A0Wh6oe6KzOOVJ-NOaJ-1a2-fyhGSXSkSg6Ldc
 */