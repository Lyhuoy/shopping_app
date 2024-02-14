import 'package:shoppingapp/core.dart';
import 'package:flutter/material.dart';

class DevScreen extends StatefulWidget {
  const DevScreen({super.key});

  @override
  State<DevScreen> createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget.normal(title: "Hello world"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // AppBottomSheet.bottomSheetBlankContent(const CountFilterView());
            },
            child: const Text(
              "Test End modal navigate",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
