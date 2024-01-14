class AbilityScoreModel {
  final String _name;
  final int _value;

  AbilityScoreModel({required String name, required int value})
      : _name = name,
        _value = value;

  String get name => _name;
  int get value => _value;
  int get modifier => (_value - 10) ~/ 2;
}
