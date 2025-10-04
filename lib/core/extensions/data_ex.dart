import 'package:intl/intl.dart';

extension DateExtension on DateTime{
  String get viewMonthName{
    return DateFormat("MMM").format(this);
    // this دى بتشاور على ال object اللى ندة ال extension
    // عملت constructor لل object وحددت ال pattern
  }
  String get viewDayNumber{
   return  day.toString();
  }
}