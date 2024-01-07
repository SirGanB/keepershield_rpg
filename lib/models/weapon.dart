import 'damage.dart';
import 'definitions.dart';

class Weapon {
  final String _name;
  final AttackType _attackType;
  final int _reach;
  final List<Damage> _damages;

  Weapon({
    required String name,
    required AttackType attackType,
    required int reach,
    required List<Damage> damages,
  })  : _name = name,
        _attackType = attackType,
        _reach = reach,
        _damages = damages;

  @override
  String toString() {
    String string;

    string = '$_name. ';
    string += '${Damage.defineAttackType(attackType: _attackType)}: ';
    string += 'reach $_reach ft. Hit: ';

    String text = '';
    for (var damage in _damages) {
      text == ''
          ? text += damage.toString()
          : text += ' + ${damage.toString()}';
    }

    string += '$text damage.';

    return string;
  }
}
