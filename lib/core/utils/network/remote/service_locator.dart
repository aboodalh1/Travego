import 'package:get_it/get_it.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:travego/core/utils/screen_size_util.dart';
import 'package:travego/features/Settings/repo/passengers_repo/passengers_repo_impl.dart';
import 'package:travego/features/favorite/repo/favorite_repo_impl.dart';
import 'package:travego/features/hotels/repo/hotels_repo_impl.dart';
import 'package:travego/features/reservation/repo/reserve_trip_repo_impl.dart';
import 'package:travego/features/search/repo/search_repo_impl.dart';
import 'package:travego/features/wallet/repo/wallet_repo_impl.dart';

import '../../../../features/Settings/repo/settings_repo_impl.dart';
import '../../../../features/auth/repo/auth_repo_impl.dart';
import '../../../../features/home/repo/cities_repo/places_repo_impl.dart';
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
  getIt.registerSingleton<PlacesRepoImpl>(
      PlacesRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<TripsRepoImpl>(TripsRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<PassengersRepoImpl>(PassengersRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<WalletRepoImpl>(WalletRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<ReserveTripRepoImpl>(ReserveTripRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<FavoriteRepoImpl>(FavoriteRepoImpl(getIt.get<DioHelper>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<DioHelper>()));

  getIt.registerSingleton(ScreenSizeUtil());
}
