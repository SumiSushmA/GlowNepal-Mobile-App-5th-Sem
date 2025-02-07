import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/get_all_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late GetAllUserUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetAllUserUsecase(repository: mockAuthRepository);
  });

  test('should return list of students on success', () async {
    // Arrange
    final students = [
      AuthEntity(
        userId: '1',
        name: 'John Doe',
        phone: '1234567890',
        email: 'johndoe@example.com',
        username: 'johndoe',
        password: 'password123',
        image: null,
        gender: 'Male',
        dob: '2000-01-01',
        address: '123 Street, City',
      ),
      AuthEntity(
        userId: '2',
        name: 'Jane Doe',
        phone: '0987654321',
        email: 'janedoe@example.com',
        username: 'janedoe',
        password: 'password123',
        image: null,
        gender: 'Female',
        dob: '1999-12-31',
        address: '456 Avenue, City',
      ),
    ];

    when(() => mockAuthRepository.getAllStudents())
        .thenAnswer((_) async => Right(students));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Right(students));
    verify(() => mockAuthRepository.getAllStudents()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return failure when repository fails', () async {
    // Arrange
    final failure =
        ApiFailure(message: 'Failed to fetch students', statusCode: 500);

    when(() => mockAuthRepository.getAllStudents())
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase();

    // Assert
    expect(result, Left(failure));
    verify(() => mockAuthRepository.getAllStudents()).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
