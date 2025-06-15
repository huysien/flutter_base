import 'package:flutter_base/src/domain/entity/rating.dart';
import 'package:flutter_base/src/domain/entity/wine.dart';
import 'package:flutter_base/src/domain/entity/wine_type.dart';
import 'package:flutter_base/src/domain/repository/wine_repository.dart';
import 'package:flutter_base/src/domain/usecase/wine/search_wine_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_wine_usecase_test.mocks.dart';

@GenerateMocks([WineRepository])
void main() {
  late SearchWineUsecase searchWineUsecase;
  late MockWineRepository mockWineRepository;

  setUp(() {
    mockWineRepository = MockWineRepository();
    searchWineUsecase = SearchWineUsecase(mockWineRepository);
  });

  test('should return list of wines from the repository', () async {
    // Arrange
    final wineType = WineType.reds;
    final wineDataModels = [
      Wine(
        id: 1,
        wine: 'Test Wine 1',
        winery: 'Test Winery 1',
        rating: Rating(average: '', reviews: ''),
        location: 'Test Location 1',
        image: 'test_image_1.png',
      ),
      Wine(
        id: 2,
        wine: 'Test Wine 2',
        winery: 'Test Winery 2',
        rating: Rating(average: '', reviews: ''),
        location: 'Test Location 2',
        image: 'test_image_2.png',
      ),
    ];

    when(mockWineRepository.getWines(
      type: wineType.name,
      name: anyNamed('name'),
      winery: anyNamed('winery'),
      location: anyNamed('location'),
    )).thenAnswer((_) async => wineDataModels);

    // Act
    final result = await searchWineUsecase(
      type: wineType,
      name: 'Test Wine',
      winery: 'Test Winery',
      location: 'Test Location',
    );

    // Assert
    expect(result, wineDataModels);
    verify(mockWineRepository.getWines(
      type: wineType.name,
      name: 'Test Wine',
      winery: 'Test Winery',
      location: 'Test Location',
    )).called(1);
  });
}
