import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/theme.dart';

final themeProvider = StateProvider((ref) => false);

//Listado de colores inmutable

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

//Un objeo de tipo AppTheme (custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );

//Controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado = new AppTheme()
  ThemeNotifier(): super( AppTheme() );

  void toogleDarkMode(){
    state = state.copyWith( isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex( int colorIndex){
    state = state.copyWith( selectedColor: colorIndex);
  }



}