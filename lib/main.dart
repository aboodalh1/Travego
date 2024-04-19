import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/blocObs.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/core/cubits/general_cubit/gen_cubit.dart';
import 'package:travego/network/local/cacheHelper.dart';
import 'package:travego/network/remote/dio_helper.dart';
import 'package:travego/shared/locale/localController.dart';
import 'package:travego/shared/locale/locale.dart';
import 'package:travego/view/auth/cubits/auth_cubit.dart';
import 'package:travego/view/layout.dart';

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
        ],
        child: GetMaterialApp(
          translations: MyLocale(),
          locale: Get.deviceLocale,
          home: LayoutScreen(),
        ));
  }
}
