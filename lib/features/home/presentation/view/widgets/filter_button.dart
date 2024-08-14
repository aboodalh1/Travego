import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../manger/home_cubit/home_cubit.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.homeCubit1});

  final HomeCubit homeCubit1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        actions: [
                          RadioListTile<String>(
                            activeColor: defaultColor,
                            title: Text('Hotels',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            value: 'Hotels',
                            groupValue: homeCubit.selectedFilter,
                            onChanged: (value) {
                              homeCubit.changeFilter(value!);
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<String>(
                            selectedTileColor: defaultColor,
                            activeColor: defaultColor,
                            title: Text('Trips',
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            value: 'Trips',
                            groupValue: homeCubit.selectedFilter,
                            onChanged: (value) {
                              homeCubit.changeFilter(value!);
                              Navigator.pop(context);
                            },
                          ),
                          RadioListTile<String>(
                              activeColor: defaultColor,
                              title: Text(
                                'Places',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              value: 'Places',
                              groupValue: homeCubit.selectedFilter,
                              onChanged: (value) {
                                homeCubit.changeFilter(value!);
                                Navigator.pop(context);
                              })
                        ],
                        content: Text(LocaleKeys.SearchFiltering.tr()));
                  });
            },
            child: Container(
              width: 45,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: defaultColor,
              ),
              child: const Icon(
                Icons.filter_list_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
