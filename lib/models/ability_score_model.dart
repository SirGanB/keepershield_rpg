class AbilityScoreModel {
  final int value;
  final bool isProfiency;

  AbilityScoreModel({required this.value, required this.isProfiency});

  int get modifier => (value - 10) ~/ 2;
}
