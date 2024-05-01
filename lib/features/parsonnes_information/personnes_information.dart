import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/parsonnes_information/personnes_cubit/person_cubit.dart';
import 'package:travego/features/parsonnes_information/personnes_cubit/person_state.dart';

import '../../core/widgets/person_card/person_card.dart';

class PersonnesInformation extends StatelessWidget {
  const PersonnesInformation({
    super.key,
    required this.startDate,
    required this.lastDate,
  });
  final String? lastDate;
  final String? startDate;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;
    final verticalPadding = mediaQueryData.size.height;

    return BlocProvider(
      create: (context) => PersonCubit(),
      child: BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Add personnes information'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text('Start date:'),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: .8, color: Colors.grey)),
                                  child: Text(startDate!),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text('End date:'),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: .8, color: Colors.grey)),
                                  child: Text(lastDate!),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Destination'),
                            Image.asset(
                              'assets/images/lakes.png',
                              fit: BoxFit.cover,
                              scale: 1.4,
                            ),
                            const Text('Mazza')
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => const PersonCard(),
                        separatorBuilder: (context, index) => SizedBox(
                          height: verticalPadding * .01,
                        ),
                        itemCount: BlocProvider.of<PersonCubit>(context).personNumber,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: GestureDetector(
                        onTap: () {
                        BlocProvider.of<PersonCubit>(context).addPerson();
                          print(
                              'cubit.passportNumber :${BlocProvider.of<PersonCubit>(context).passportNumber}');
                          print(BlocProvider.of<PersonCubit>(context).passportNumber);
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                    style: BorderStyle.solid)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Add person',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: horizontalPadding * 0.013,
                                ),
                                const Icon(Icons.add)
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
