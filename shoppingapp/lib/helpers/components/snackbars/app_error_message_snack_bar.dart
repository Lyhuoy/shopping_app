import 'package:flutter/material.dart';

class AppErrorMessageSnackBar extends StatelessWidget {
  final bool netState;
  final String title;
  final String message;
  final Color stateColor;
  final bool showProgress;

  const AppErrorMessageSnackBar(
      {Key? key,
      this.netState = true,
      this.title = '',
      this.message = '',
      this.stateColor = Colors.amber,
      this.showProgress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();

    return Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: stateColor,
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 23),
                          ),
                          Text(
                            message,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ));
  }
}
