import 'package:flutter/material.dart';

class TransferJelekong extends StatefulWidget {
  const TransferJelekong({super.key});

  @override
  State<TransferJelekong> createState() => _TransferJelekongState();
}

class _TransferJelekongState extends State<TransferJelekong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WAKAF MASUK'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 112,
                decoration: const BoxDecoration(color: Colors.lime),
              ),
              const SizedBox(height: 10),
              Container(
                height: 550,
                color: Colors.lime.shade100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
