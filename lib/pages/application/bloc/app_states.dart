part of 'app_blocs.dart';

class AppState {
  final int index;

  const AppState({this.index = 0});
}

final class AppInitial extends AppState {
  const AppInitial({super.index});
}
