import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/blocObs.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/features/auth/views/register_screen.dart';
import 'package:travego/core/utils/shared/constant.dart';
import 'package:travego/core/utils/shared/styles/Styles.dart';
import 'package:travego/features/auth/manger/auth_cubit.dart';
import 'core/utils/network/remote/service_locator.dart';
import 'features/create_trip/parsonnes_information/personnes_cubit/person_cubit.dart';
import 'features/home/home_cubit/home_cubit.dart';
import 'features/presentation/auth_manger/auth_repo_impl.dart';
import 'core/utils/network/local/cacheHelper.dart';
import 'core/utils/network/remote/dio_helper.dart';
import 'core/utils/shared/locale/locale.dart';
import 'package:dio/dio.dart';
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupServiceLocator();
  // token = CacheHelper.getData(key: 'token');
  runApp(const MyApp());
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
            create: (context) => GeneralCubit(),
          ),
        ],
        child: GetMaterialApp(
          theme: isDark ? darkTheme : lightTheme,
          translations: MyLocale(),
          locale: Get.deviceLocale,
          debugShowCheckedModeBanner: false,
          home:  RegisterScreen(),
        ));
  }
}