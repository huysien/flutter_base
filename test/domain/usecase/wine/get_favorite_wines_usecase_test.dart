import 'package:flutter_base/src/domain/entity/rating.dart';
import 'package:flutter_base/src/domain/entity/wine.dart';
import 'package:flutter_base/src/domain/repository/wine/wine_repository.dart';
import 'package:flutter_base/src/domain/usecase/wine/get_favorite_wines_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_favorite_wines_usecase_test.mocks.dart';

@GenerateMocks([WineRepository])
void main() {
  late GetFavoriteWinesUsecase getFavoriteWinesUsecase;
  late MockWineRepository mockWineRepository;

  setUp(() {
    mockWineRepository = MockWineRepository();
    getFavoriteWinesUsecase = GetFavoriteWinesUsecase(mockWineRepository);
  });

  test('should return list of favorite wines from the repository', () async {
    // Arrange
    final wineDataModels = [
      Wine(
        id: 1,
        wine: 'Test Wine 1',
        winery: 'Test Winery 1',
        rating: Rating(average: "", reviews: ""),
        location: 'Test Location 1',
        image: 'test_image_1.png',
      ),
      Wine(
        id: 2,
        wine: 'Test Wine 2',
        winery: 'Test Winery 2',
        rating: Rating(average: "", reviews: ""),
        location: 'Test Location 2',
        image: 'test_image_2.png',
      ),
    ];

    when(mockWineRepository.getFavoriteWines())
        .thenAnswer((_) async => wineDataModels.map((wine) => wine).toList());

    // Act
    final result = await getFavoriteWinesUsecase();

    // Assert
    expect(result, wineDataModels);
    verify(mockWineRepository.getFavoriteWines()).called(1);
  });
}
