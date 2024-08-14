import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/translations/locale_keys.g.dart';

import '../../../features/general_cubit/layout_cubit.dart';

BottomNavigationBar customBottomNavBar(BuildContext context) {
  return BottomNavigationBar(
    currentIndex: BlocProvider.of<GeneralCubit>(context).navBarSelectedItem,
    onTap: (value) {
      BlocProvider.of<GeneralCubit>(context)
          .changeBottomNavBar(value, context);
    },
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(icon: const Icon(Icons.home), label: LocaleKeys.home.tr()),
      BottomNavigationBarItem(icon: const Icon(Icons.sos), label: LocaleKeys.Explore.tr(),),
      BottomNavigationBarItem(
          icon: const Icon(Icons.home_work_outlined), label: LocaleKeys.Hotels.tr()),
      BottomNavigationBarItem(
          icon: const Icon(Icons.settings), label: LocaleKeys.Settings.tr())
    ],
  );
}