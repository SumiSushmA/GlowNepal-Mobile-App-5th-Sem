import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/data/model/stylist_model.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/domain/repository/stylist_repository.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/domain/use_case/get_stylists_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock Repository
class MockStylistRepository extends Mock implements StylistRepository {}

void main() {
  late GetStylistsUseCase getStylistsUseCase;
  late MockStylistRepository mockStylistRepository;

  setUp(() {
    mockStylistRepository = MockStylistRepository();
    getStylistsUseCase = GetStylistsUseCase(mockStylistRepository);
    registerFallbackValue(<StylistModel>[]);
  });

  final tStylists = [
    StylistModel(
      id: '1',
      name: 'John Doe',
      speciality: 'Hair Stylist',
      image: 'https://example.com/image1.jpg',
      experience: '5 years',
      bookingFee: 50.0,
      available: true,
      about: 'Expert in modern haircuts.',
    ),
    StylistModel(
      id: '2',
      name: 'Jane Doe',
      speciality: 'Makeup Artist',
      image: 'https://example.com/image2.jpg',
      experience: '3 years',
      bookingFee: 40.0,
      available: false,
      about: 'Specialist in bridal makeup.',
    ),
  ];

  test('should return a list of stylists from the repository', () async {
    // Arrange
    when(() => mockStylistRepository.getStylists())
        .thenAnswer((_) async => tStylists);

    // Act
    final result = await getStylistsUseCase.execute();

    // Assert
    expect(result, equals(tStylists));
    verify(() => mockStylistRepository.getStylists()).called(1);
    verifyNoMoreInteractions(mockStylistRepository);
  });

  test('should return an empty list when no stylists are available', () async {
    // Arrange
    when(() => mockStylistRepository.getStylists()).thenAnswer((_) async => []);

    // Act
    final result = await getStylistsUseCase.execute();

    // Assert
    expect(result, isEmpty);
    verify(() => mockStylistRepository.getStylists()).called(1);
  });

  test('should return a list containing at least one stylist', () async {
    // Arrange
    when(() => mockStylistRepository.getStylists())
        .thenAnswer((_) async => [tStylists.first]);

    // Act
    final result = await getStylistsUseCase.execute();

    // Assert
    expect(result, isNotEmpty);
    expect(result.length, equals(1));
    verify(() => mockStylistRepository.getStylists()).called(1);
  });

  test('should return an exception when repository throws an error', () async {
    // Arrange
    when(() => mockStylistRepository.getStylists())
        .thenThrow(Exception('Database error'));

    // Act & Assert
    expect(() => getStylistsUseCase.execute(), throwsException);
    verify(() => mockStylistRepository.getStylists()).called(1);
  });
}
