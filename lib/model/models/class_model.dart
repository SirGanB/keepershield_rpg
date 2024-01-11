class ClassModel {
  final String _name;
  final int _level;

  ClassModel({required String name, required int level})
      : _name = name,
        _level = level;
  String get name => _name;
  int get level => _level;

  @override
  String toString() {
    return '$_name, lvl: $_level';
  }
}
