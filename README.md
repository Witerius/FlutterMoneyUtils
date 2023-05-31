# Clear amount from trash

Use getMoneyCleared for clear amount

# Args:
String? amount - num for clearing. May be null or string num. 

Example:

    getMoneyCleared('12^3'),

    getMoneyCleared('3dgsd'),

    getMoneyCleared('43$&453'),

    getMoneyCleared(123@.03')

    getMoneyCleared(123,03')

    print:

    123

    3

    43453

    123.03

    123.03
    

String? lang - lang of locale. Default 'ru'. May be 'en', 'kz'

bool isUserEntered - args for clear '-', if function used in editText field with user input
