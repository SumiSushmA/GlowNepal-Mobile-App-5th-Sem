import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/api_service.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/local_datasource/user_login_local_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/data_source/user_login_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_login_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/model/user_signup_hive_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/data/repository/user_login_data_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/repository/user_login_domain_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/domain/use_case/login/user_login_usecases.dart';
import 'package:glownepal_mobile_app_5th_sem/features/authentication/presentation/view_model/login/user_login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  _initSplashDependencies();
  _initOnboardingDependencies();
  _initLoginDependencies();
  initApiService();
  initSharedPreferences();
}

Future<void> initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

void initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

Future<void> _initHiveService() async {
  await Hive.initFlutter();

  // Register Hive Adapters
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserLoginHiveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(UserSignupHiveModelAdapter());
  }

  // Open Hive Boxes
  final userLoginBox = await Hive.openBox<UserLoginHiveModel>('userLoginBox');
  final userSignupBox =
      await Hive.openBox<UserSignupHiveModel>('userSignupBox');

  // Register HiveService with opened boxes
  getIt.registerLazySingleton<HiveService>(
    () => HiveService(
      userLoginBox: userLoginBox,
      userSignupBox: userSignupBox,
    ),
  );
}

void _initSplashDependencies() {
  getIt.registerFactory<SplashCubit>(() => SplashCubit());
}

void _initOnboardingDependencies() {
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
}

void _initLoginDependencies() {
  // Data Source
  getIt.registerFactory<IUserLoginDataSource>(
      () => UserLoginLocalDatasource(getIt<HiveService>()));

  // Repository
  getIt.registerLazySingleton<UserLoginDomainRepository>(
      () => UserLoginDataRepositoryImpl(getIt<IUserLoginDataSource>()));

  // Use Cases
  getIt.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(getIt<UserLoginDomainRepository>()));
  getIt.registerLazySingleton<SaveUserUseCase>(
      () => SaveUserUseCase(getIt<UserLoginDomainRepository>()));
  getIt.registerLazySingleton<DeleteUserUseCase>(
      () => DeleteUserUseCase(getIt<UserLoginDomainRepository>()));
  getIt.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(getIt<UserLoginDomainRepository>()));

  // Bloc
  getIt.registerFactory<UserLoginBloc>(() => UserLoginBloc(
        saveUserUseCase: getIt<SaveUserUseCase>(),
        loginUserUseCase: getIt<LoginUserUseCase>(),
        deleteUserUseCase: getIt<DeleteUserUseCase>(),
        getAllUsersUseCase: getIt<GetAllUsersUseCase>(),
      ));
}
