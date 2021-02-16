import 'package:shein_complete_myorder/models/person.dart';

class Contribution{
  Person creator;
  String createdAt;
  List<Person> contributors;
  double currentPrice;
  double minPrice;
  double maxPrice;
  bool active;
  String location;
}