import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glownepal_mobile_app_5th_sem/app/shared_prefs/token_shared_prefs.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/api_service.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/data_source/local_data_source/auth_local_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/login_usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/data_source/stylist_remote_data_source.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/domain/repository/stylist_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/stylist_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // **ORDER MATTERS**: Correct sequence to avoid errors!

  _initHiveService();
  _initApiService();
  await _initSharedPreferences();
  _initTokenSharedPrefs();

  // ✅ Feature-Specific Dependencies
  _initAuthDependencies();
  _initStylistDependencies();
  _initHomeDependencies();
  _initSplashScreenDependencies();
  _initOnboardingScreenDependencies();
}

// ========================== Hive Service Initialization ==========================
void _initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

// ========================== API Service Initialization ==========================
void _initApiService() {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

// ========================== Shared Preferences Initialization ==========================
Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

// ========================== Token Shared Preferences ==========================
void _initTokenSharedPrefs() {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );
}

// ========================== Authentication Dependencies ==========================
void _initAuthDependencies() {
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<AuthLocalRepository>(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRemoteRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(getIt<AuthRemoteRepository>()),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

// ========================== Stylist Dependencies (Fixed) ==========================
void _initStylistDependencies() {
  getIt.registerLazySingleton<StylistRemoteDataSource>(
    () => StylistRemoteDataSource(),
  );

  getIt.registerLazySingleton<StylistRepository>(
    () => StylistRepositoryImpl(getIt<StylistRemoteDataSource>()),
  );

  getIt.registerFactory<StylistCubit>(
    () => StylistCubit(getIt<StylistRepository>()),
  );
}

// ========================== Home Dependencies ==========================
void _initHomeDependencies() {
  getIt.registerSingleton<HomeCubit>(HomeCubit());
}

// ========================== Splash Dependencies ==========================
void _initSplashScreenDependencies() {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(),
  );
}

// ========================== Onboarding Dependencies ==========================
void _initOnboardingScreenDependencies() {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(getIt<LoginBloc>()),
  );
}
