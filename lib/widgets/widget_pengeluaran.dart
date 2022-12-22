import 'package:flutter/material.dart';

class WidgetPengeluaran extends StatefulWidget {
  const WidgetPengeluaran({super.key});

  @override
  State<WidgetPengeluaran> createState() => _WidgetPengeluaranState();
}

class _WidgetPengeluaranState extends State<WidgetPengeluaran> {
  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.grey.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 500,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'TAMBAH BARU',
                style: TextStyle(fontSize: 16),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: const [],
              ),
            ),
          ),
        ),
      );
}
