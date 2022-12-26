// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracer_learn_getx/core/constants/constants.dart';
import 'package:weight_tracer_learn_getx/core/controller/controller.dart';
import 'package:weight_tracer_learn_getx/core/models/record.dart';

class RecordListTile extends StatelessWidget {
  RecordListTile({super.key, required this.record});

  final Record record;
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: ListTile(
        leading: _buildDate(),
        title: _buildWeight(),
        trailing: _buildIcons(),
      ),
    );
  }

  Row _buildIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Constants.colorGrey)),
        IconButton(
            onPressed: () {
              _controller.deleteRecord(record);
            },
            icon: const Icon(Icons.delete, color: Constants.colorRed)),
      ],
    );
  }

  Center _buildWeight() {
    return Center(
        child: Text(
      record.weight.toString(),
      style: const TextStyle(fontSize: 24),
    ));
  }

  Text _buildDate() => Text(DateFormat('EEE,MMM  d').format(record.dateTime));
}
