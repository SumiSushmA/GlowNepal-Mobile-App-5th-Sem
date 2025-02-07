import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/core/error/failure.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/repository/auth_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Manually create a mock class for IAuthRepository
class MockIAuthRepository extends Mock implements IAuthRepository {}

// Create a Fake class for File
class FakeFile extends Fake implements File {}

void main() {
  late UploadImageUsecase usecase;
  late MockIAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockIAuthRepository();
    usecase = UploadImageUsecase(mockAuthRepository);

    // Register fallback value for File
    registerFallbackValue(FakeFile());
  });

  test('should upload image and return image URL on success', () async {
    // Arrange
    final file = File('test_image.jpg');
    final params = UploadImageParams(file: file);
    const imageUrl = 'https://example.com/profile.jpg';

    when(() => mockAuthRepository.uploadProfilePicture(any()))
        .thenAnswer((_) async => const Right(imageUrl));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, const Right(imageUrl));
    verify(() => mockAuthRepository.uploadProfilePicture(any())).called(1);
  });

  test('should return failure when upload fails', () async {
    // Arrange
    final file = File('test_image.jpg');
    final params = UploadImageParams(file: file);
    final failure = ApiFailure(message: 'Server error', statusCode: 500);

    when(() => mockAuthRepository.uploadProfilePicture(any()))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, Left(failure));
    verify(() => mockAuthRepository.uploadProfilePicture(any())).called(1);
  });
}
