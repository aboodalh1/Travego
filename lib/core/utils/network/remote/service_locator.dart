import 'package:get_it/get_it.dart';
import 'package:travego/core/utils/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:travego/features/presentation/auth_manger/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<DioHelper>()));
}
