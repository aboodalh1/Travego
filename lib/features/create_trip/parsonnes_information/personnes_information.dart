import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travego/core/utils/shared/components/components.dart';
import 'package:travego/core/widgets/person_card/person_card.dart';

import 'personnes_cubit/person_cubit.dart';


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

    return BlocConsumer<PersonCubit, PersonState>(
      listener: (context, state) {},
      builder: (context, state) {
        final personCubit = BlocProvider.of<PersonCubit>(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('Add persons information'.tr),
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
                              Text('Start date:'.tr),
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
                              Text('End date:'.tr),
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
                          Text('Destination'.tr),
                          Image.asset(
                            'assets/images/lakes.png',
                            fit: BoxFit.cover,
                            scale: 1.4,
                          ),
                          const Text('Mazza')
                        ],
                      ) ,
                      Spacer(),
                      // Column(
                      //   children: [
                      //      Text('Hotel'.tr),
                      //     ClipRRect(
                      //       borderRadius: BorderRadius.circular(10),
                      //       child: Image.asset(
                      //
                      //         'assets/images/hotel1.jpg',
                      //         fit: BoxFit.cover,
                      //         scale: 2.4
                      //       ),
                      //     ),
                      //     const Text('فندق النجمة')
                      //   ],
                      //
                      // )
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
                      itemCount: personCubit.personNumber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                            personCubit.addPerson();
                              print(
                                  'cubit.passportNumber :${personCubit.passportNumber}');
                              print(personCubit.passportNumber);
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
                                    Text(
                                      'Add person'.tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: horizontalPadding * 0.013,
                                    ),
                                    const Icon(Icons.add)
                                  ],
                                )),
                          ),
                        ),
                        Spacer(),
                        Container(color:defaultColor,child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)))
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
