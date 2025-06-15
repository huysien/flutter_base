import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'wine_detail_view_model.dart';

class WineDetailPage extends ConsumerWidget {
  const WineDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(wineDetailViewModelProvider);
    // TODO: Implement your page UI here
    return Scaffold();
  }
}
