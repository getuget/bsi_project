import 'package:flutter/material.dart';

import '../forms/form_jelekong_out.dart';
import '../forms/form_pengeluaran.dart';

class PengeluaranJelekong extends StatelessWidget {
  const PengeluaranJelekong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => FormJelekongOut(
                          addCatatanPengeluaran: (p0) {},
                        ));
              },
              child: const Text('Tambah Catatan'))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const FormPengeluaranJelekong());

          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const FormPengeluaranJelekong()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
