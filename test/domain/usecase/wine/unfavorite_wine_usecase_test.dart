import 'package:flutter_base/src/domain/repository/wine_repository.dart';
import 'package:flutter_base/src/domain/usecase/wine/unfavorite_wine_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unfavorite_wine_usecase_test.mocks.dart';

@GenerateMocks([WineRepository])
void main() {
  late UnfavoriteWineUsecase unfavoriteWineUsecase;
  late MockWineRepository mockWineRepository;

  setUp(() {
    mockWineRepository = MockWineRepository();
    unfavoriteWineUsecase = UnfavoriteWineUsecase(mockWineRepository);
  });

  test('should call unfavoriteWine on the repository', () async {
    // Arrange
    final wineId = 1;

    // Act
    await unfavoriteWineUsecase(wineId);

    // Assert
    verify(mockWineRepository.unfavoriteWine(wineId)).called(1);
  });
}
