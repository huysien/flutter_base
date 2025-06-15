import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/wine.dart';

class WineList extends StatelessWidget {
  const WineList({
    super.key,
    required List<Wine> wines,
    required List<Wine> favoriteWines,
    required void Function(Wine) onFavorite,
    required void Function(Wine) onUnfavorite,
  })  : _onFavorite = onFavorite,
        _onUnfavorite = onUnfavorite,
        _favoriteWines = favoriteWines,
        _wines = wines;

  final List<Wine> _wines;
  final List<Wine> _favoriteWines;
  final void Function(Wine) _onFavorite;
  final void Function(Wine) _onUnfavorite;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: _wines.length,
        itemBuilder: (context, index) {
          final wine = _wines[index];
          final isWineFavorited = _favoriteWines.any(
            (favoriteWine) => favoriteWine.id == wine.id,
          );
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildWineImage(wine),
                    SizedBox(width: 8),
                    Expanded(
                      child: _buildWineDescription(wine),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: _buildFavoriteButton(
                  isWineFavorited: isWineFavorited,
                  wine: wine,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(
          indent: 91,
          height: 1,
        ),
      );

  Widget _buildWineImage(Wine wine) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CachedNetworkImage(
          imageUrl: wine.image,
          width: 75,
          height: 100,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );

  Widget _buildWineDescription(Wine wine) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            wine.winery,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(wine.wine),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              Text(wine.rating.average),
              Text(" (${wine.rating.reviews})"),
            ],
          ),
          Text(wine.location.replaceAll('\n', ' ')),
        ],
      );

  Widget _buildFavoriteButton({
    required bool isWineFavorited,
    required Wine wine,
  }) =>
      IconButton(
        visualDensity: VisualDensity.compact,
        iconSize: 18,
        icon: Icon(
          isWineFavorited ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () =>
            isWineFavorited ? _onUnfavorite(wine) : _onFavorite(wine),
      );
}
