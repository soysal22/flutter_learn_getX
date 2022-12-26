// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracer_learn_getx/core/controller/controller.dart';
import 'package:weight_tracer_learn_getx/core/models/record.dart';
import 'package:weight_tracer_learn_getx/view/widget/record_list_tile.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("History"),
          ),
          body: records.isEmpty == true
              ? const Center(child: Text("Please add some Records"))
              : ListView(
                  children: _controller.records
                      .map((record) => RecordListTile(record: record))
                      .toList(),
                ),
        ));
  }
}
