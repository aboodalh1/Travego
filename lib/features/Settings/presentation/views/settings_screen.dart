import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:travego/core/utils/shared/Widgets/default_button.dart';
import 'package:travego/core/widgets/alert_dialog/loading_alert_dialog.dart';
import 'package:travego/features/Settings/presentation/views/widgets/settings_stack/settings_stack.dart';
import 'package:travego/features/Settings/repo/settings_repo_impl.dart';
import '../../../../core/utils/network/remote/service_locator.dart';
import '../../../../core/utils/shared/constant.dart';
import '../manger/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(getIt.get<SettingsRepoImpl>())

        ..getMyAccount(token: token),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SettingsCubit>(context);
          if (state is GetUserInfoError ) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Try Again'),
                    DefaultElevated(
                        label: 'Try Again',
                        fill: false,
                        onPressed: () {
                          cubit.getMyAccount(token: token);
                        })
                  ],
                ),
              ),
            );
          }
          if (state is GetUserInfoLoading) {
            return const LoadingAlertDialog();
          }

          return SafeArea(
            child: Scaffold(
              body: SettingsStack(cubit: cubit),
            ),
          );
        },
      ),
    );
  }
}
