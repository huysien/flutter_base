import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entity/wine_type.dart';

class SelectWineTypePage extends ConsumerWidget {
  const SelectWineTypePage({super.key, required WineType selectedWineType})
      : _selectedWineType = selectedWineType;

  final WineType _selectedWineType;

  void _onWineTypeSelected(BuildContext context, WineType wineType) {
    Navigator.pop(context, wineType);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListView(
        children: WineType.values
            .map((wineType) => ListTile(
                  title: Text(wineType.name),
                  trailing:
                      wineType == _selectedWineType ? Icon(Icons.check) : null,
                  onTap: () => _onWineTypeSelected(context, wineType),
                ))
            .toList(),
      );
}
