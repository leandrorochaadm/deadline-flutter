import 'package:flutter/material.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final RegisterController controller;
  RegisterPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Registros de tempo'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  final now = DateTime.now();

                  DateTime previus = widget.controller.listRegister.last.date;
                  final calcRes = widget.controller.calc(now, previus);
                  widget.controller.listRegister.add(calcRes);
                });
              },
              child: const Text('Add')),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.controller.listRegister.length,
            itemBuilder: (context, index) {
              final item = widget.controller.listRegister[index];
              return Text("$index : ${item.date} | ${item.diff}");
            },
          ),
        ],
      ),
    );
  }
}
