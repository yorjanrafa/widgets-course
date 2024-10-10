import 'package:a01_widgets/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider(
  (ref) => false,
);

// listado de colores inmutables

final colorListProvider = Provider((ref) => colorsList);

final selectedColorProvider = StateProvider((ref) => 0);
