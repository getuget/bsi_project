import 'package:flutter/material.dart';

import '../forms/form_jelekong_out_copy.dart';
// import '../forms/form_jelekong_out.dart';
import '../forms/form_pengeluaran.dart';

class PengeluaranJelekong extends StatelessWidget {
  const PengeluaranJelekong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    // builder: (context) => FormJelekongOut(
                    builder: (context) => const CopyFormJelekongOut());
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
