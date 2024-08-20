import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:travego/blocObs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/screen_size_util.dart';

import 'package:travego/core/utils/shared/styles/light_theme.dart';
import 'package:travego/features/Settings/presentation/manger/passenger/passenger_cubit.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';
import 'package:travego/splash_screen.dart';
import 'package:travego/translations/codegen_loader.g.dart';

import 'core/utils/network/local/cacheHelper.dart';
import 'core/utils/network/remote/service_locator.dart';
import 'core/utils/notification/notification_services.dart';
import 'core/utils/notification/pusher_service.dart';
import 'core/utils/shared/styles/dark_theme.dart';
import 'features/auth/presentation/manger/auth_cubit.dart';
import 'features/auth/repo/auth_repo_impl.dart';
import 'features/create_trip/parsonnes_information/personnes_cubit/person_cubit.dart';
import 'features/general_cubit/layout_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  CacheHelper.getData(key: 'token');
  setupServiceLocator();
  // await LocalNotificationService.init();
  // WebSocketService().connect();
  runApp(EasyLocalization(
      path: 'assets/translations/',
      supportedLocales: const [Locale('en'), Locale('ar')],
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create: (BuildContext context) => PersonCubit(),
          ),
          BlocProvider(
              create: (BuildContext context) =>
                  PassengerCubit(getIt.get<PassengersRepoImpl>())),
            BlocProvider(
            create: (context) => GeneralCubit(),
          ),
        ],
        child: MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: lightTheme,
          darkTheme: darkTheme,
          locale: context.locale,
          debugShowCheckedModeBanner: true,
          home: easySplash(),
        ));
  }
}
