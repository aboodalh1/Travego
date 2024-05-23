import 'package:get_it/get_it.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/features/presentation/auth_manger/auth_repo_impl.dart';
import 'package:travego/features/presentation/hotels_manger/hotels_repo_impl.dart';

import '../../../../features/presentation/cities_manger/cities_repo_impl.dart';
import '../../../../features/presentation/trips_manger/trips_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<HotelsRepoImpl>(
      HotelsRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<CitiesRepoImpl>(
      CitiesRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<TripsRepoImpl>(TripsRepoImpl(getIt.get<DioHelper>()));

  getIt.registerSingleton(ScreenSizeUtil());
}
