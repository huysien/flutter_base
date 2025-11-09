import 'package:flutter_base/src/domain/entity/rating.dart';
import 'package:flutter_base/src/domain/entity/wine.dart';
import 'package:flutter_base/src/domain/repository/wine/wine_repository.dart';
import 'package:flutter_base/src/domain/usecase/wine/favorite_wine_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorite_wine_usecase_test.mocks.dart';

@GenerateMocks([WineRepository])
void main() {
  late FavoriteWineUsecase favoriteWineUsecase;
  late MockWineRepository mockWineRepository;

  setUp(() {
    mockWineRepository = MockWineRepository();
    favoriteWineUsecase = FavoriteWineUsecase(mockWineRepository);
  });

  test('should call favoriteWine on the repository', () async {
    // Arrange
    final wine = Wine(
      id: 1,
      wine: 'Test Wine',
      winery: 'Test Winery',
      rating: Rating(average: "", reviews: ""),
      location: 'Test Location',
      image: 'test_image.png',
    );

    // Act
    await favoriteWineUsecase(wine);

    // Assert
    verify(mockWineRepository.favoriteWine(wine)).called(1);
  });
}
