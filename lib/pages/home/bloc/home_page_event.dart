abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;
  HomePageDots(this.index);
}
