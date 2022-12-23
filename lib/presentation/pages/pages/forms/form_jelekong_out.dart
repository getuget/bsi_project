import 'package:flutter/material.dart';

import 'package:bsi_project/provider/model/pengeluaran.dart';

class FormJelekongOut extends StatefulWidget {
  final Function(Pengeluaran) addCatatanPengeluaran;
  const FormJelekongOut({
    Key? key,
    required this.addCatatanPengeluaran,
  }) : super(key: key);

  @override
  State<FormJelekongOut> createState() => _FormJelekongOutState();
}

class _FormJelekongOutState extends State<FormJelekongOut> {
  TextEditingController? keteranganController;
  TextEditingController? qtyController;
  TextEditingController? nilaiController;

  List<Pengeluaran> pengeluaranList = [];
  void addCatatanPengeluaran(Pengeluaran pengeluaran) {
    setState(() {
      pengeluaranList.add(pengeluaran);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              decoration: const BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'PENGELUARAN NO.35',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child: ListView.builder(
                itemBuilder: ((context, index) => Card(
                      child: ListTile(
                        leading:
                            Text(pengeluaranList[index].banyaknya.toString()),
                        title:
                            Text(pengeluaranList[index].keterangan.toString()),
                        subtitle: Text(pengeluaranList[index].nilai.toString()),
                        trailing:
                            Text(pengeluaranList[index].jumlah.toString()),
                      ),
                    )),
                itemCount: pengeluaranList.length,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.blue.shade100),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildKeterangan(),
                      buildQty(),
                      buildNilai(),
                    ],
                  ),
                  const SizedBox(height: 3),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(280)),
                    onPressed: () {
                      final pengeluaran = Pengeluaran(
                          id: 1,
                          nomor: 31,
                          tanggal: '25 agustus 2022',
                          banyaknya: qtyController?.text,
                          keterangan: keteranganController?.text,
                          nilai: nilaiController?.text,
                          jumlah: '650000');

                      // widget.addCatatanPengeluaran;
                    },
                    child: const Text('Catat'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKeterangan() => Container(
        width: 120,
        height: 35,
        color: Colors.blue.shade50,
        child: TextFormField(
          controller: keteranganController,
          decoration: const InputDecoration(
              labelText: 'Keterangan',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45))),
        ),
      );

  Widget buildQty() => Container(
        width: 50,
        height: 35,
        color: Colors.blue.shade50,
        child: TextFormField(
          controller: qtyController,
          decoration: const InputDecoration(
              labelText: 'Qty',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45))),
        ),
      );

  Widget buildNilai() => Container(
        width: 80,
        height: 35,
        color: Colors.blue.shade50,
        child: TextFormField(
          controller: nilaiController,
          decoration: const InputDecoration(
              labelText: 'Nilai',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45))),
        ),
      );
}
