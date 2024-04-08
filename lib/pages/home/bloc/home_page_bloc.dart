import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_event.dart';

import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageDots>(_homePageDots);
  }

  void _homePageDots(HomePageDots event, Emitter<HomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
