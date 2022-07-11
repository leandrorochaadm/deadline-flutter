import 'package:deadline/ui/pages/life/life_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'life_controller.dart';

class LifePage extends StatefulWidget {
  final LifeController controller;
  LifePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<LifePage> createState() => _LifePageState();
}

class _LifePageState extends State<LifePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dias da vida'), centerTitle: true),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: DateFormat("dd/MM/yyyy")
                            .format(widget.controller.dateStartLife),
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          labelText: "Data do seu nascimento",
                        ),
                        validator: widget.controller.validForm,
                        onChanged: (_) {
                          setState(() {
                            formKey.currentState?.validate();
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  )),
              widget.controller.beginningDaysStartLife() > 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Inicio'),
                                Text(
                                  '${widget.controller.beginningDaysStartLife()}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                    '${widget.controller.percentagePassedLife()}%'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Fim'),
                                Text(
                                  '${widget.controller.missingDaysEndLife()}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                    '${widget.controller.percentageTheEndLife()}%'),
                              ],
                            ),
                          ],
                        ),
                      ],
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
