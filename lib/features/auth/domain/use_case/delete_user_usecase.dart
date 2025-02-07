import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:glownepal_mobile_app_5th_sem/app/usecase/usecase.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';

class DeleteUserParams extends Equatable {
  final String userId;

  const DeleteUserParams({required this.userId});

  const DeleteUserParams.empty() : userId = "_empty.string";

  @override
  List<Object?> get props => [userId];
}

class DeleteUserUsecase implements UsecaseWithParams<void, DeleteUserParams> {
  final IAuthRepository repository;

  const DeleteUserUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteUserParams params) async {
    return await repository.deleteStudent(params.userId);
  }
}
