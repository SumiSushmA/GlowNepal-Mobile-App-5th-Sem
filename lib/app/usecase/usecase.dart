import 'package:dartz/dartz.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';

// Usecase with parameters
abstract class UsecaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Usecase without parameters
abstract class UsecaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}
