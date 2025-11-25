import 'package:flutter/material.dart';
import 'package:ui_widget/AlertDialogs.dart';
import 'package:ui_widget/ContainerWidget.dart';
import 'package:ui_widget/Datatables.dart';
import 'package:ui_widget/GridViews.dart';
import 'package:ui_widget/ListViews.dart';
import 'package:ui_widget/Stacks.dart';
import 'package:ui_widget/Tabbars.dart';
import 'package:ui_widget/button.dart';
import 'package:ui_widget/circleProgressIndicator.dart';
import 'package:ui_widget/linearProgressIndicator.dart';
import 'package:ui_widget/pageControllers.dart';
import 'package:ui_widget/pickers.dart';
import 'package:ui_widget/scrollViews.dart';
import 'package:ui_widget/searchBars.dart';
import 'package:ui_widget/segmentedButtons.dart';
import 'package:ui_widget/slider.dart';
import 'package:ui_widget/stepper.dart';
import 'package:ui_widget/switches.dart';
import 'package:ui_widget/textField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Listviews(title: 'Flutter Demo Home Page'),
    );
  }
}
