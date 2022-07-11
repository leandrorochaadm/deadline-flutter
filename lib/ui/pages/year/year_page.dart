import 'package:flutter/material.dart';

import 'year_controller.dart';

class YearPage extends StatelessWidget {
  final YearController controller;
  const YearPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dias do ano'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DIAS DO ANO', style: Theme.of(context).textTheme.headline1),
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
                    value: controller.beginningDaysStartYear(),
                    percente: controller.percentagePassedYear(),
                  ),
                  DisplayWidget(
                    label: 'Dias pra o fim',
                    value: controller.missingDaysEndYear(),
                    percente: controller.percentageTheEndYear(),
                  ),
                  const SizedBox(height: 8),
                  DisplayWidget(
                    label: 'Semanas do início',
                    value: controller.beginningWeeksStartYear(),
                  ),
                  DisplayWidget(
                    label: 'Semanas pra o fim',
                    value: controller.missingWeeksEndYear(),
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
