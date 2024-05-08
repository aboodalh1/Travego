import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travego/blocObs.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travego/features/Settings/views/LanguageScreen/LangRadioController/LanguageRadioButtonController.dart';
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
          theme: isDark ? darkTheme : lightTheme,
          translations: MyLocale(),
          locale: Get.deviceLocale,
          home:  LayoutScreen(),
        ));
  }
}
// class AnimatedWid extends StatefulWidget {
//   @override
//   State<AnimatedWid> createState() => _AnimatedWidState();
// }
//
// class _AnimatedWidState extends State<AnimatedWid> {
//   double w = 200.0;
//   double op = 0 ;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
//           InkWell(
//             onTap: (){
//              setState(() {
//                if(w<300){
//                w=300;
//                op = 1;}
//                else {w=200;
//                op = 0;}
//              });
//             },
//             child: Center(child:
//               AnimatedOpacity(
//                 duration: const Duration(seconds: 1),
//                 opacity: op,
//                 child: Container(
//                   width: w,
//                   height: 200,
//                   color: Colors.red,
//                 ),
//               ),),
//           )
//         ],
//       ),
//     );
//   }
// }