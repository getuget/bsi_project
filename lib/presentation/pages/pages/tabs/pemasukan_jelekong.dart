import 'package:flutter/material.dart';

import '../forms/form_transfer_jelekong.dart';

class PemasukanJelekong extends StatelessWidget {
  const PemasukanJelekong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TransferJelekong()));
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text('listview pemasukan di sini')],
        ),
      ),
    );
  }
}
