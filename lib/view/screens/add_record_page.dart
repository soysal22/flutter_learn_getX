// ignore_for_file: unused_local_variable, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:weight_tracer_learn_getx/core/constants/constants.dart';
import 'package:weight_tracer_learn_getx/core/controller/controller.dart';
import 'package:weight_tracer_learn_getx/core/models/record.dart';

class AddRecordPage extends StatefulWidget {
  const AddRecordPage({super.key});

  @override
  State<AddRecordPage> createState() => _AddRecordPageState();
}

class _AddRecordPageState extends State<AddRecordPage> {
  int _selectedWeight = 70;
  DateTime selectedDate = DateTime.now();
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("Add New Record"),
      ),
      body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _cardNumberPicker(),
          _datePickerDesign(context),
          _button(),
        ],
      ),
    );
  }

  GestureDetector _datePickerDesign(context) {
    return GestureDetector(
      onTap: () {
        _pickDate(context);
      },
      child: Card(
          color: Constants.colorGrey,
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.calendar,
                  size: 40,
                ),
                Expanded(
                    child: Text(
                  DateFormat.yMMMMEEEEd().format(selectedDate),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          )),
    );
  }

  SizedBox _button() {
    return SizedBox(
      height: 60,
      width: 160,
      child: ElevatedButton(
          onPressed: () {
            _controller.addRecord(
                Record(dateTime: selectedDate, weight: _selectedWeight));
            Navigator.of(context).pop();
          },
          child: const Text("Save", style: TextStyle(fontSize: 30))),
    );
  }

  Card _cardNumberPicker() {
    return Card(
      color: Constants.colorGrey,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.weightScale,
              size: 50,
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              NumberPicker(
                //  infiniteLoop: true,  // yavaş kaydırmaya yarar
                // zeroPad: true, // başına sıfır koymaya yarar
                selectedTextStyle:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                axis: Axis.horizontal,
                // step: 5,  // Kaçarlı atlaması gererktiğini burada söylüyoruz
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Constants.colorRed, width: 5)),
                itemCount: 3,
                itemHeight: 100,
                itemWidth: 90,
                minValue: -10,
                maxValue: 200,
                value: _selectedWeight,
                onChanged: (value) {
                  setState(() {
                    _selectedWeight = value;
                  });
                },
              ),
              const Icon(
                FontAwesomeIcons.chevronUp,
                color: Constants.colorWhite,
                size: 30,
              )
            ])
          ],
        ),
      ),
    );
  }

  void _pickDate(context) async {
    // Date Picker ı göster ve seçili tarihi selectedDate ata

    var initialDate = DateTime.now();

    // seçilecek olan yeni tarihi de otomatik olarak ekranda görebilmek için null safety özzelliğin kullandım

    var newDate = await showDatePicker(
          builder: (context, child) {
            return Theme(
                data: ThemeData.dark(), child: child ?? const Text(""));
          },
          context: context,
          initialDate: initialDate,
          firstDate: initialDate.subtract(const Duration(days: 365)),
          // 365 vb geride ki bir günün seçebilsin diye

          // buraya   bu şekilde de DateTime(2100) yazabiliriz
          lastDate: initialDate.add(const Duration(days: 30)),
          // 30 ilerideki bir tarihi seçebilsin diye
        ) ??
        selectedDate;
    // set state i çağır ekranın yenilenmesi için

    if (newDate != null) {
      selectedDate = newDate;
    }

    setState(() {});
    print(selectedDate.toString());
  }
}
