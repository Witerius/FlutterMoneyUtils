import 'package:flutter_money_utils/money.dart';
import 'package:flutter_test/flutter_test.dart';

void testsGetMoneyCleared() {

  test('тест getMoneyCleared', () {
    expect(_testGetMoneyCleared('±§!@#\$&*;:[]`~%^&100000.0'), '100000.0');
    expect(_testGetMoneyCleared('100000&*()^.0'), '100000.0');
    expect(_testGetMoneyCleared('100000&*()^,0'), '100000.0');
    expect(_testGetMoneyCleared('100000&*()^.00'), '100000.00');
    expect(_testGetMoneyCleared('100000&*()^,00'), '100000.00');
    expect(_testGetMoneyCleared('100000&*()^'), '100000');
    expect(_testGetMoneyCleared('1000&*()^00'), '100000');

    expect(_testGetMoneyCleared('±§!@#\$&*;:[]`~%^&100000.0', isUserEntered: true), '100000.0');
    expect(_testGetMoneyCleared('100000&*()^.0', isUserEntered: true), '100000.0');
    expect(_testGetMoneyCleared('100000&*()^,0', isUserEntered: true), '100000.0');
    expect(_testGetMoneyCleared('100000&*()^.00', isUserEntered: true), '100000.00');
    expect(_testGetMoneyCleared('100000&*()^,00', isUserEntered: true), '100000.00');
    expect(_testGetMoneyCleared('100000&*()^', isUserEntered: true), '100000');
    expect(_testGetMoneyCleared('1000&*()^00', isUserEntered: true), '100000');

    _testWithLang(Money.kz);
    _testWithLang(Money.ru);
    _testWithLang(Money.en);

    _testWithMinus(Money.ru);
    _testWithMinus(Money.kz);
    _testWithMinus(Money.en);

    _testCyrillic(Money.kz);
    _testCyrillic(Money.ru);

  });
}

String _testGetMoneyCleared(String? amount, {String? lang, bool isUserEntered = false}) {
  return getMoneyCleared(amount, lang: lang, isUserEntered: isUserEntered);
}

void _testCyrillic(String lang) {
  expect(_testGetMoneyCleared('100000&*()^,0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000&*()^,00', lang: lang), '100000.00');
  expect(_testGetMoneyCleared('100000&*()^,0', lang: lang, isUserEntered: true), '100000.0');
  expect(_testGetMoneyCleared('100000&*()^,00', lang: lang, isUserEntered: true), '100000.00');

}

void _testWithLang(String lang) {
  expect(_testGetMoneyCleared('±§!@#\$&*;:[]`~%^&100000.0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('1000±§!@#\$&*;:[]`~%^&00.0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&.0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000.±§!@#\$&*;:[]`~%^&0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[].`~%^&0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&.', lang: lang), '100000.');
  expect(_testGetMoneyCleared('10000.1±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.1');
  expect(_testGetMoneyCleared('10000.0±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.0');
  expect(_testGetMoneyCleared('10000.10±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.10');
  expect(_testGetMoneyCleared('10000.01±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.01');
  expect(_testGetMoneyCleared('10000.00±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('10000.000±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('10000.0000±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('10000.00000±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('10000.001000±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('10000.0000000000±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('10000.00000000001±§!@#\$&*;:[]`~%^&.', lang: lang), '10000.00');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&..', lang: lang), '100000.');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&...', lang: lang), '100000.');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&....', lang: lang), '100000.');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&..0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&..00', lang: lang), '100000.00');
  expect(_testGetMoneyCleared('100000±§!@#\$&*;:[]`~%^&.0.00', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000&*()^.0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('100000&*()^.00', lang: lang), '100000.00');
  expect(_testGetMoneyCleared('100000&*()^', lang: lang), '100000');
  expect(_testGetMoneyCleared('1000&*()^00', lang: lang), '100000');
  expect(_testGetMoneyCleared('1000000000', lang: lang), '1000000000');
  expect(_testGetMoneyCleared('1000000000.0', lang: lang), '1000000000.0');
  expect(_testGetMoneyCleared('1000000000.00', lang: lang), '1000000000.00');
  expect(_testGetMoneyCleared('10000000000.00', lang: lang), '1000000000');
  expect(_testGetMoneyCleared('100000000000.00', lang: lang), '1000000000');
  expect(_testGetMoneyCleared('1000000000000.00', lang: lang), '1000000000');
  expect(_testGetMoneyCleared('1000000000000.000', lang: lang), '1000000000');

  expect(_testGetMoneyCleared('±§!@#\$&*;:[]`~%^&100000.0', lang: lang, isUserEntered: true), '100000.0');
  expect(_testGetMoneyCleared('100000&*()^.0', lang: lang, isUserEntered: true), '100000.0');
  expect(_testGetMoneyCleared('100000nJтЕтiЩда.0', lang: lang, isUserEntered: true), '100000.0');
  expect(_testGetMoneyCleared('100000&*()^.00', lang: lang, isUserEntered: true), '100000.00');
  expect(_testGetMoneyCleared('100000PhjnтлОР.00', lang: lang, isUserEntered: true), '100000.00');

  expect(_testGetMoneyCleared('100000&*()^', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1000&*()^00', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ00', lang: lang, isUserEntered: true), '100000');
}

void _testWithMinus(String lang) {
  expect(_testGetMoneyCleared('-100000', lang: lang), '-100000');
  expect(_testGetMoneyCleared('--100000', lang: lang), '-100000');
  expect(_testGetMoneyCleared('--100-000', lang: lang), '-100000');
  expect(_testGetMoneyCleared('-100000.0', lang: lang), '-100000.0');
  expect(_testGetMoneyCleared('-1000zXьЛ00', lang: lang), '-100000');
  expect(_testGetMoneyCleared('1-000zXьЛ00', lang: lang), '100000');
  expect(_testGetMoneyCleared('1000-zXьЛ00', lang: lang), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ-00', lang: lang), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ00-', lang: lang), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ00.-', lang: lang), '100000.');
  expect(_testGetMoneyCleared('1000zXьЛ00.-0', lang: lang), '100000.0');
  expect(_testGetMoneyCleared('1000zXьЛ00.-00', lang: lang), '100000.00');
  expect(_testGetMoneyCleared('1000zXьЛ00.-0-0', lang: lang), '100000.00');
  expect(_testGetMoneyCleared('-1000zXьЛ00.-0-0', lang: lang), '-100000.00');

  expect(_testGetMoneyCleared('-100000', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('--100000', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('--100-000', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('-100000.0', lang: lang, isUserEntered: true), '100000.0');
  expect(_testGetMoneyCleared('-1000zXьЛ00', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1-000zXьЛ00', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1000-zXьЛ00', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ-00', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ00-', lang: lang, isUserEntered: true), '100000');
  expect(_testGetMoneyCleared('1000zXьЛ00.-', lang: lang, isUserEntered: true), '100000.');
  expect(_testGetMoneyCleared('1000zXьЛ00.-0', lang: lang, isUserEntered: true), '100000.0');
  expect(_testGetMoneyCleared('1000zXьЛ00.-00', lang: lang, isUserEntered: true), '100000.00');
  expect(_testGetMoneyCleared('1000zXьЛ00.-0-0', lang: lang, isUserEntered: true), '100000.00');
  expect(_testGetMoneyCleared('-1000zXьЛ00.-0-0', lang: lang, isUserEntered: true), '100000.00');

}
