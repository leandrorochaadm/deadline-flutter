import 'package:flutter/material.dart';

import 'quarter_controller.dart';

class QuarterPage extends StatelessWidget {
  final QuarterController controller;
  const QuarterPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      appBar: AppBar(title: const Text('Dias do quarter'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DIAS DO QUARTER',
                style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 16),
            Text(
              'Hoje é ${controller.dateToday()}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DisplayWidget(
                    label: 'Dias do início',
                    value: controller.beginningDaysStartQuarter(),
                    percente: controller.percentagePassedQuarter(),
                  ),
                  DisplayWidget(
                    label: 'Dias pra o fim',
                    value: controller.missingDaysEndQuarter(),
                    percente: controller.percentageTheEndQuarter(),
                  ),
                  const SizedBox(height: 8),
                  DisplayWidget(
                    label: 'Semanas do início',
                    value: controller.beginningWeeksStartQuarter(),
                  ),
                  DisplayWidget(
                    label: 'Semanas pra o fim',
                    value: controller.missingWeeksEndQuarter(),
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

class DisplayWidget extends StatelessWidget {
  final int value;
  final String percente;
  final String label;

  const DisplayWidget({
    Key? key,
    required this.value,
    this.percente = '',
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 175,
          child: Text(label),
        ),
        SizedBox(
          width: 75,
          child: Text(
            '$value',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        percente != '' ? Text('$percente %') : const SizedBox.shrink(),
      ],
    );
  }
}
