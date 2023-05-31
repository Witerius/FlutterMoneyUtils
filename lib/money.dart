import 'dart:developer' as developer;

class Money {
  static const moneyCleanEn = "[^0-9.]";
  static const moneyCleanRu = "[^0-9,.]";

  static const String ru = 'ru';
  static const String kz = 'kz';
  static const String en = 'en';
  static const String kzt = '₸';

  static String currentLang = ru;
  static String currentMoneySymbol = kzt;

  int amount = 0;
  String currency = kzt;

  Money(this.amount, {String currency = kzt});

  Money.initString({String? amount, String currency = kzt}) {
    this.amount = amount as int? ?? 0;
  }

  Money.initDouble({double? amount, String currency = kzt}) {
    this.amount = amount as int? ?? 0;
  }

  Money.initMoney(Money? amount) {
    this.amount = amount?.amount ?? 0;
    currency = amount?.currency ?? kzt;
  }
}

String getMoneyCleared(String? amount, {String? lang, bool isUserEntered = false}) {
  String amountLocaleCleaned = _clearMoneyForLocale(amount, lang, isUserEntered);
  return _clearMoneyMaxSymbols(amountLocaleCleaned, isUserEntered);
}

String _clearMoneyForLocale(String? amount, String? lang, bool isUserEntered) {
  RegExp? regex;

  if (lang == Money.en) {
    regex = RegExp(Money.moneyCleanEn);
  } else {
    regex = RegExp(Money.moneyCleanRu);
  }

  var amountLocaleCleaned =
      amount?.replaceAll(regex, '').replaceAll(',', '.') ?? '0';

  var manyComa = amountLocaleCleaned.split('.');

  if (manyComa.length > 2) {
    try {
      amountLocaleCleaned = '${manyComa[0]}.${manyComa[1] != '' ? manyComa[1] : manyComa[2]}';
    } catch (e, m) {
      developer.log('clearMoneyForLocale error: $e; $m');
    }
  }

  if (!isUserEntered && amount?.startsWith("-") == true) {
    amountLocaleCleaned = "-$amountLocaleCleaned";
  }

  return amountLocaleCleaned;
}

String _clearMoneyMaxSymbols(String amountLocaleCleaned, bool isUserEntered) {
  var amountSplited = amountLocaleCleaned.split(".");

  if (amountSplited[0].length > 10) {
    return amountSplited[0].substring(0, 10);

  } else if (amountSplited.length > 1) {
    return _clearDecimalMaxSymbols(amountSplited);

  } else if (isUserEntered && amountSplited.length > 1) {
    return '${amountSplited[0]}.${amountSplited[1]}';

  } else {
    return amountSplited[0];
  }
}

String _clearDecimalMaxSymbols(List<String> amountSplited) {
  var decimal = amountSplited[1];
  if (decimal.length > 2) {
    decimal = amountSplited[1].substring(0, 2);
  }

  return '${amountSplited[0]}.$decimal';
}
