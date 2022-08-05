import 'package:intl/intl.dart';

String getFormatedDate(DateTime dt, {String format="dd/MM/yyy HH:mm"}) =>
    DateFormat(format).format(dt);


