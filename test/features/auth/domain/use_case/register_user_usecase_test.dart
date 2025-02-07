import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/entity/auth_entity.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class FakeAuthEntity extends Fake implements AuthEntity {}

void main() {
  late RegisterUseCase usecase;
  late MockAuthRepository mockAuthRepository;

  setUpAll(() {
    registerFallbackValue(FakeAuthEntity());
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = RegisterUseCase(mockAuthRepository);
  });

  test('should register user successfully', () async {
    // Arrange
    final params = RegisterUserParams(
      name: 'John Doe',
      phone: '1234567890',
      email: 'johndoe@example.com',
      username: 'johndoe',
      password: 'password123',
      image: null,
      gender: 'Male',
      dob: '2000-01-01',
      address: '123 Street, City',
    );

    final authEntity = AuthEntity(
      name: params.name,
      phone: params.phone,
      email: params.email,
      username: params.username,
      password: params.password,
      image: params.image,
      gender: params.gender,
      dob: params.dob,
      address: params.address,
    );

    when(() => mockAuthRepository.registerStudent(authEntity))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockAuthRepository.registerStudent(authEntity)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return failure when registration fails', () async {
    // Arrange
    final params = RegisterUserParams(
      name: 'Jane Doe',
      phone: '0987654321',
      email: 'janedoe@example.com',
      username: 'janedoe',
      password: 'password123',
      image: null,
      gender: 'Female',
      dob: '1999-12-31',
      address: '456 Avenue, City',
    );

    final failure = ApiFailure(message: 'Registration failed', statusCode: 500);

    when(() => mockAuthRepository.registerStudent(any()))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(Left(failure)));
    verify(() => mockAuthRepository.registerStudent(any())).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
