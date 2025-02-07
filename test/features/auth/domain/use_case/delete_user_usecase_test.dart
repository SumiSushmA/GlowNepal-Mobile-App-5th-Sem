import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/delete_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late DeleteUserUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = DeleteUserUsecase(repository: mockAuthRepository);
  });

  test('should delete user successfully', () async {
    // Arrange
    const params = DeleteUserParams(userId: '123');

    when(() => mockAuthRepository.deleteStudent(params.userId))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockAuthRepository.deleteStudent(params.userId)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return failure when repository fails', () async {
    // Arrange
    const params = DeleteUserParams(userId: '123');
    final failure = ApiFailure(message: 'Deletion failed', statusCode: 500);

    when(() => mockAuthRepository.deleteStudent(params.userId))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(Left(failure)));
    verify(() => mockAuthRepository.deleteStudent(params.userId)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
