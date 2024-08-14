import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/network/remote/service_locator.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';
import 'package:travego/features/Settings/repo/settings_repo_impl.dart';

import '../../../../../core/utils/shared/components/components.dart';
import '../../../../../core/utils/shared/constant.dart';
import '../../../../../core/widgets/custom_progress_indicator/custom_progress_indicator.dart';
import '../../../../../core/widgets/custom_snack_bar/custom_snack_bar.dart';
import '../../../../../core/widgets/loading_failure_widget/loading_failure_widget.dart';

class MyAdditionalInfoScreen extends StatelessWidget {
  const MyAdditionalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt.get<SettingsRepoImpl>())
        ..getMyPassport(token: token),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is GetInfoError) {
            customSnackBar(
                context,
                state.error.toString() == '404'
                    ?  "You didn't add this information yet"
                    : state.error);
          }
          if (state is AddInfoError) {
            customSnackBar(context, state.error);
          }
          if (state is AddInfoSuccess) {
            customSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
          if (state is GetInfoError && state.error.toString() != '404') {
            return ErrorLoadingScreen(
              buttonTitle: 'Try again',
              appBarTitle: 'My Personal ID Screen',
              centerTitle: 'Check your connection',
              onButtonPressed: () {
                settingsCubit.getMyPersonalId(token: token);
              },
              refreshFunction: () async {},
            );
          }
          return RefreshIndicator(
            color: defaultColor,
            onRefresh: () async {
              settingsCubit.navBarSelectedItem == 0
                  ? settingsCubit.getMyPassport(token: token)
                  : settingsCubit.navBarSelectedItem == 1
                      ? settingsCubit.getMyVisa(token: token)
                      : settingsCubit.getMyPersonalId(token: token);
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Additional Information'),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: settingsCubit.navBarSelectedItem,
                onTap: (value) {
                  settingsCubit.changeBottomNavBar(value, context);
                  settingsCubit.navBarSelectedItem == 0
                      ? settingsCubit.getMyPassport(token: token)
                      : settingsCubit.navBarSelectedItem == 1
                          ? settingsCubit.getMyVisa(token: token)
                          : settingsCubit.getMyPersonalId(token: token);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_travel), label: 'Passport'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.credit_card_rounded), label: 'Visa'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_outlined),
                      label: 'Personal ID'),
                ],
              ),
              body: state is GetInfoLoading? const Center(child: CustomProgressIndicator(),):settingsCubit.screens[settingsCubit.navBarSelectedItem],
            ),
          );
        },
      ),
    );
  }
}
