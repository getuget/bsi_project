import 'package:bsi_project/provider/api/sheets/jelekong_api.dart';
import 'package:bsi_project/provider/model/pengeluaran.dart';
import 'package:flutter/material.dart';

class FormPengeluaranJelekong extends StatefulWidget {
  const FormPengeluaranJelekong({super.key});

  @override
  State<FormPengeluaranJelekong> createState() =>
      _FormPengeluaranJelekongState();
}

class _FormPengeluaranJelekongState extends State<FormPengeluaranJelekong> {
  final formKey = GlobalKey<FormState>();
  String? keterangan;
  String? qty;
  String? nilai;
  Pengeluaran? nomor;

  final keteranganController = TextEditingController();
  final qtyController = TextEditingController();
  final nilaiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNomor();
  }

  Future getNomor() async {
    final nomor = await JelekongKeluarSheetsApi.getLastNomor();

    setState(() {
      this.nomor = nomor as Pengeluaran?;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = [];
    return Scaffold(
      appBar: AppBar(
        title: Text('PENGELUARAN JELEKONG $nomor'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                insertUsers(); // 2ND METHOD FOR INSERT

                // const pengeluaran = Pengeluaran(//First method, singular insert
                //     id: 1,
                //     nomor: 31,
                //     tanggal: '12/12/2022',
                //     banyaknya: '10',
                //     keterangan: 'semen',
                //     satuan: 'zak',
                //     nilai: '65000',
                //     jumlah: '650000');

                // await JelekongKeluarSheetsApi.insert([pengeluaran.toJson()]);
              },
              icon: const Icon(Icons.check_sharp))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         builder: (context) => const WidgetPengeluaran());
      //   },
      //   backgroundColor: Colors.blueAccent,
      //   child: const Icon(Icons.add),
      // ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 112,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 200,
                            height: 35,
                            color: Colors.blue.shade50,
                            child: TextFormField(
                              controller: keteranganController,
                              onChanged: (value) =>
                                  setState(() => keterangan = value),
                              decoration: const InputDecoration(
                                  labelText: 'Keterangan',
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45))),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Container(
                            width: 50,
                            height: 35,
                            color: Colors.brown.shade100,
                            child: TextFormField(
                              controller: qtyController,
                              onChanged: (value) => setState(() => qty = value),
                              decoration: const InputDecoration(
                                  // floatingLabelStyle: TextStyle(fontSize: 18),
                                  // hintText: 'keterangan',
                                  labelText: 'Qty',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Container(
                            width: 80,
                            height: 35,
                            color: Colors.brown.shade50,
                            child: TextFormField(
                              controller: nilaiController,
                              onChanged: (value) =>
                                  setState(() => nilai = value),
                              decoration: const InputDecoration(
                                  // floatingLabelStyle: TextStyle(fontSize: 18),
                                  // hintText: 'keterangan',
                                  labelText: 'Nilai',
                                  border: OutlineInputBorder()),
                              // validator: (value) {
                              //   if (value!.length < 4) {
                              //     return 'masukkan lebih dari 4 karakter';
                              //   } else {
                              //     return null;
                              //   }
                              // },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromWidth(350)),
                          onPressed: () {
                            setState(() {
                              entries.add(keteranganController.text);
                            });
                            // // saving with validator
                            // final isValid = formKey.currentState!.validate();
                            // if (isValid) {
                            //   formKey.currentState!.save();
                            // }
                          },
                          child: const Text('TAMBAH')),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 500,
                  color: Colors.teal,
                  child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(entries[index]),
                      );
                    },
                  ),
                )
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //       minimumSize: const Size.fromHeight(50),
                //       shape: const StadiumBorder()),
                //   onPressed: () {},
                //   child: const Text('simpan'),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future insertUsers() async {
    // 2nd METHOD FOR INSERT
    final pengeluarans = [
      const Pengeluaran(
          id: 1,
          nomor: 31,
          tanggal: '12/12/2022',
          banyaknya: '10',
          keterangan: 'semen',
          satuan: 'zak',
          nilai: '65000',
          jumlah: '650000'),
      const Pengeluaran(
          id: 2,
          nomor: 31,
          tanggal: '12/12/2022',
          banyaknya: '5',
          keterangan: 'paralon saluran',
          satuan: 'buah',
          nilai: '20000',
          jumlah: '100000')
    ];

    final jsonPengeluaran =
        pengeluarans.map((pengeluaran) => pengeluaran.toJson()).toList();

    await JelekongKeluarSheetsApi.insert(jsonPengeluaran);
  }
}
