import 'package:deadline/ui/pages/life/life_controller.dart';
import 'package:flutter/material.dart';

import 'life_controller.dart';

class LifePage extends StatefulWidget {
  final LifeController controller;
  LifePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<LifePage> createState() => _LifePageState();
}

class _LifePageState extends State<LifePage> {
  final formKey = GlobalKey<FormState>();
  int days = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dias da vida'), centerTitle: true),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: '20220709',
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                              labelText: "Data do seu nascimento"),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Data obrigatória";
                            }
                            DateTime dateValid;
                            try {
                              dateValid = DateTime.parse(value);
                            } catch (_) {
                              return 'Data inválida';
                            }

                            if (DateTime.now().isBefore(dateValid)) {
                              return 'Data deve ser menor que hoje';
                            }

                            days = DateTime.now().difference(dateValid).inDays;

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formKey.currentState?.validate();
                          });
                        },
                        child: const Text('Calculcar'),
                      ),
                    ],
                  )),
              days > 0
                  ? Text(
                      days.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        /*child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DIAS DA VIDA', style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 16),

            Text(
              'Data: ${controller.dateEndLifeStr()}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 8),
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
        ),*/
      ),
    );
  }
}
