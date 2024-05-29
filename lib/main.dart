import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/blocObs.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/core/utils/shared/styles/Styles.dart';
import 'package:travego/features/Settings/presentation/manger/settings_cubit.dart';
import 'package:travego/features/Settings/repo/settings_repo_impl.dart';
import 'package:travego/features/first_screen.dart';
import 'package:travego/features/hotels/presentation/manger/hotel_cubit.dart';
import 'package:travego/features/hotels/repo/hotels_repo_impl.dart';
import 'package:travego/translations/codegen_loader.g.dart';
import 'core/utils/network/remote/service_locator.dart';
import 'features/auth/presentation/manger/auth_cubit.dart';
import 'features/auth/repo/auth_repo_impl.dart';
import 'features/create_trip/parsonnes_information/personnes_cubit/person_cubit.dart';
import 'features/general_cubit/layout_cubit.dart';
import 'core/utils/network/local/cacheHelper.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  setupServiceLocator();
  // await Hive.initFlutter();
  // Hive.registerAdapter(UserAdapter());
  //  boxUser = await Hive.openBox<User>('userBox');
   // boxPersons.put('Gg', userModel);
  runApp(EasyLocalization(
      path: 'assets/translations/',
      supportedLocales: const[
        Locale('en'),
        Locale('ar')
      ],
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
            create: (BuildContext context) => SettingsCubit(getIt.get<SettingsRepoImpl>()),
          ), BlocProvider(
            create: (BuildContext context) => HotelsCubit(getIt.get<HotelsRepoImpl>()),
          ),

          BlocProvider(
            create: (context) => GeneralCubit(),
          ),
        ],
        child: GetMaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          theme: isDark ? darkTheme : lightTheme,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home:  FirstScreen(),
        ));
  }
}