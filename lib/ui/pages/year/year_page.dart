import 'package:flutter/material.dart';

import 'year_controller.dart';

class YearPage extends StatelessWidget {
  final YearController controller;
  const YearPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DEAD LINE TIME',
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            const Text('Dias do ano'),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Inicio'),
                      Text(
                        '${controller.missingDaysEndYear()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text('${controller.percentagePassedYear()}%'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Fim'),
                      Text(
                        '${controller.beginningDaysStartYear()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text('${controller.percentageTheEndYear()}%'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
