import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intl/intl.dart';


class HourModel {
  final String name;
  final int price;
  

  HourModel({
    required this.name,
    required this.price,
  });
}
