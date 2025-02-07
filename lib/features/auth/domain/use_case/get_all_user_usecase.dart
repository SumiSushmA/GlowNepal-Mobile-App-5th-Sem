import 'package:dartz/dartz.dart';
import 'package:glownepal_mobile_app_5th_sem/app/usecase/usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';

class GetAllUserUsecase implements UsecaseWithoutParams {
  final IAuthRepository repository;
  const GetAllUserUsecase({required this.repository});

  @override
  Future<Either<Failure, List<AuthEntity>>> call() {
    return repository.getAllStudents();
  }
}
