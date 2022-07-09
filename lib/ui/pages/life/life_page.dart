import 'package:deadline/ui/pages/life/life_controller.dart';
import 'package:flutter/material.dart';

import 'life_controller.dart';

class LifePage extends StatelessWidget {
  final LifeController controller;
  const LifePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dias da vida'), centerTitle: true),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DIAS DA VIDA', style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Inicio'),
                      Text(
                        '${controller.beginningDaysStartLife()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text('${controller.percentagePassedLife()}%'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Fim'),
                      Text(
                        '${controller.missingDaysEndLife()}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text('${controller.percentageTheEndLife()}%'),
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
