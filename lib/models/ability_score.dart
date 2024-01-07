abstract class AbilityScore {
  AbilityScore({
    required String name,
    required int value,
  });

  static int calcProfiencyBonus({required int playerLevel}) {
    int value;

    value = playerLevel ~/ 4;
    value < 1 ? value + 2 : value + 1;

    return value;
  }

  static int calcModifier({required int value}) => value = (value - 10) ~/ 2;
}
