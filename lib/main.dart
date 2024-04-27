import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/blocObs.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/home/home_cubit/home_cubit.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/core/utils/shared/styles/Styles.dart';
import 'package:travego/features/auth/manger/auth_cubit.dart';
import 'package:travego/features/layout.dart';
import 'package:travego/features/location/manger/location_cubit.dart';

import 'core/utils/network/local/cacheHelper.dart';
import 'core/utils/network/remote/dio_helper.dart';
import 'core/utils/shared/locale/localController.dart';
import 'core/utils/shared/locale/locale.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  // token = CacheHelper.getData(key: 'token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => GeneralCubit(),
          ),
          BlocProvider(
            create: (context) => LocationCubit(),
          ),
        ],
        child: GetMaterialApp(
          theme: isDark ? darkTheme : lightTheme,
          translations: MyLocale(),
          locale: Get.deviceLocale,
          home: const LayoutScreen(),
        ));
  }
}
