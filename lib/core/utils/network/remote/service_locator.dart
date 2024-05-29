import 'package:get_it/get_it.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';
import 'package:travego/features/hotels/repo/hotels_repo_impl.dart';

import '../../../../features/Settings/repo/settings_repo_impl.dart';
import '../../../../features/auth/repo/auth_repo_impl.dart';
import '../../../../features/home/repo/cities_repo/cities_repo_impl.dart';
import '../../../../features/home/repo/trips_repo/trips_repo_impl.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<SettingsRepoImpl>(SettingsRepoImpl(getIt.get<DioHelper>()));

  getIt.registerSingleton<HotelsRepoImpl>(
      HotelsRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<CitiesRepoImpl>(
      CitiesRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<TripsRepoImpl>(TripsRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<PassengersRepoImpl>(PassengersRepoImpl(getIt.get<DioHelper>()));

  getIt.registerSingleton(ScreenSizeUtil());
}
