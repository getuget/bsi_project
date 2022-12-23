import 'package:bsi_project/presentation/pages/pages/forms/expense_form.dart';
import 'package:flutter/material.dart';

import '../forms/form_pengeluaran.dart';

class PengeluaranJelekong extends StatelessWidget {
  const PengeluaranJelekong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: ElevatedButton(
          onPressed: ()

              // => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const CopyFormJelekongOut(),
              //   ),
              // ),

              {
            showDialog(
                context: context,
                builder: (context) => const CopyFormJelekongOut());
          },
          child: const Text('Tambah Catatan'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const FormPengeluaranJelekong());
        },
        // builder: (context) => const CopyFormJelekongOut()),

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const FormPengeluaranJelekong()));
        // },
        child: const Icon(Icons.add),
      ),
    );
  }

  void openDialg(BuildContext context) {
    showDialog(
        context: context,
        // builder: (context) => FormJelekongOut(

        builder: (context) {
          return const CopyFormJelekongOut();
        });
  }
}
