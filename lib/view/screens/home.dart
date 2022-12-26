// ignore_for_file: unused_field, must_be_immutable

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracer_learn_getx/core/constants/constants.dart';
import 'package:weight_tracer_learn_getx/core/controller/controller.dart';
import 'package:weight_tracer_learn_getx/view/screens/add_record_page.dart';
import 'package:weight_tracer_learn_getx/view/screens/graph.dart';
import 'package:weight_tracer_learn_getx/view/screens/history.dart';

class Home extends StatefulWidget {
  Home({super.key, this.bottomNavIndex = 0});
  int bottomNavIndex;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Controller _controller = Get.put(Controller());
  final iconList = <IconData>[
    Icons.auto_graph_rounded,
    Icons.history_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NotificationListener<ScrollNotification>(
        child:
            widget.bottomNavIndex == 0 ? const GrahpScreen() : HistoryScreen(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Constants.colorBlack,
        inactiveColor: Constants.colorWhite,
        height: Get.height / 12,
        activeColor: Constants.colorOrange,
        iconSize: 30,
        icons: iconList,
        activeIndex: widget.bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => setState(() => widget.bottomNavIndex = index),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddRecordPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
