class Controller {
  // Turn in to Singleton
  static final Controller _instance = Controller._internal();
  Controller._internal();
  factory Controller() => _instance;

  static listShuffler({required List collection}) {
    collection.shuffle();
    return collection.first;
  }
}
