import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  var list = <ItemDate>[ItemDate(date: DateTime.now(), diff: 0)];

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                final now = DateTime.now();
                ItemDate previus = widget.list.last;

                final calcRes = calc(now, previus.date);
                widget.list.add(calcRes);
                setState(() {});
              },
              child: const Text('Add')),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return Text(
                "$index : ${widget.list[index].date} - ${widget.list[index].diff}",
                style: const TextStyle(color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemDate {
  final DateTime date;
  final int diff;

  ItemDate({required this.date, required this.diff});
}

ItemDate calc(DateTime now, DateTime previus) {
  final diff = now.difference(previus).inSeconds;
  return ItemDate(date: now, diff: diff);
}
