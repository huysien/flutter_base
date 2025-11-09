import '../../repository/wine/wine_repository.dart';

class UnfavoriteWineUsecase {
  final WineRepository _wineRepository;

  UnfavoriteWineUsecase(this._wineRepository);

  Future<void> call(int id) => _wineRepository.unfavoriteWine(id);
}
