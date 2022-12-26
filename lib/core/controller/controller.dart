// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:weight_tracer_learn_getx/core/models/record.dart';

class Controller extends GetxController {
  var records = <Record>[
    //   Record(dateTime: DateTime.now(), weight: 80, note: "Hello"),
    //   Record(dateTime: DateTime.now(), weight: 70, note: "gitti"),
    //   Record(dateTime: DateTime.now(), weight: 75, note: "sevsinler"),
    //   Record(dateTime: DateTime.now(), weight: 77, note: "severler "),
    //   Record(dateTime: DateTime.now(), weight: 85, note: "deli"),
    //   Record(dateTime: DateTime.now(), weight: 62, note: "CANO"),
  ].obs;

  void addRecord(Record record) {
    // records
    //     .add(Record(dateTime: DateTime.now(), weight: 50, note: "gel canooo"));

    records.add(record);

    print("Listede olan Recordların sayısı : ${records.length}");
  }

  void deleteRecord(Record record) {
    records.remove(record);
    print("Listede kalan Recordların sayısı : ${records.length}");
  }
}
