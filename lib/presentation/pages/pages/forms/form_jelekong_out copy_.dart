

import 'package:bsi_project/provider/model/pengeluaran%20copy_.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';

// import 'package:bsi_project/provider/model/pengeluaran.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CopyFormJelekongOut extends HookConsumerWidget {
  const CopyFormJelekongOut({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keteranganController = useTextEditingController();
    final nilaiController = useTextEditingController();
    final qtyController = useTextEditingController();
    final satuanController = useTextEditingController();
    final nomorNotaController = useTextEditingController();

    // final noNotaFocusNode = useFocusNode();
    final keteranganFocusNode = useFocusNode();
    final qtyFocusNode = useFocusNode();
    final satuanFocusNode = useFocusNode();
    final jumlahFocusNode = useFocusNode();

    final tombolCatatFocusNode = useFocusNode();

    final dateController = useTextEditingController();
    final initialValue = DateTime.now();
    final format = DateFormat("dd MMM, yyyy  HH:mm");

    const uuid = Uuid();

    final postPengeluaran = ref.watch(pengeluaranListProvider).where((element) => false);

    InputDecoration input(String labelName) {
      return InputDecoration(
          labelText: labelName,
          labelStyle: const TextStyle(fontSize: 13),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)));
    }

    return Dialog(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'PENGELUARAN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              color: Colors.grey[100],
                              height: 25,
                              width: 150,
                              child: TextField(
                                controller: nomorNotaController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'Nota Nomor',
                                    labelStyle: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 13,
                                      // decoration: TextDecoration()
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black45))),
                              ),
                            )
                          ],
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: Colors.grey[300],
                            height: 25,
                            width: 130,
                            child: DateTimeField(
                              format: format,
                              readOnly: true,
                              resetIcon: null,
                              textAlign: TextAlign.end,
                              autovalidateMode: AutovalidateMode.disabled,
                              initialValue: initialValue,
                              style: const TextStyle(fontSize: 13),
                              onSaved: (DateTime? d) {
                                if (d != null) {
                                  dateController.text =
                                      "${d.day}-${d.month}-${d.year} \n ${d.hour}:${d.minute}";
                                  // print("HEADER DATETIME: ${ctrl.receiptDateController.text}");
                                }
                              },
                              // decoration: inputDec(),
                              // style: textStyle(),
                              // style: const TextStyle(fontSize: 11.5),
                              onShowPicker: (context, currentValue) async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.convert(time);
                              },
                            ),
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          // TODO === >>> R E T R I E V E   M O D E L   V A L U E
                        ],
                        
                        // [
                        //   Row(children: [
                        //     Text(postPengeluaran),
                        //     Text('b'),
                        //     Text('c'),
                        //     Text('d'),
                        //     Text('e'),
                        //     Text('f'),
                        //   ])
                        // ],
                      )
                    ],
                  ),

                  // child: ListView.builder(
                  //   itemBuilder: ((context, index) => Card(
                  //         child: ListTile(
                  //           leading:
                  //               Text(pengeluaranList[index].banyaknya.toString()),
                  //           title:
                  //               Text(pengeluaranList[index].keterangan.toString()),
                  //           subtitle: Text(pengeluaranList[index].nilai.toString()),
                  //           trailing:
                  //               Text(pengeluaranList[index].jumlah.toString()),
                  //         ),
                  //       )),
                  //   itemCount: pengeluaranList.length,
                  // ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.blue.shade100),
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 90,
                          height: 35,
                          color: Colors.blue.shade50,
                          child: TextFormField(
                            controller: keteranganController,
                            focusNode: keteranganFocusNode,
                            textInputAction: TextInputAction.next,
                            decoration: input('Keterangan'),
                            onFieldSubmitted: (value) {
                              Focus.of(context).requestFocus(qtyFocusNode);
                            },
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 35,
                          color: Colors.blue.shade50,
                          child: TextFormField(
                            controller: qtyController,
                            focusNode: qtyFocusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: input("Qty"),
                            onFieldSubmitted: (value) {
                              Focus.of(context).requestFocus(satuanFocusNode);
                            },
                          ),
                        ),
                        Container(
                          width: 65,
                          height: 35,
                          color: Colors.blue.shade50,
                          child: TextFormField(
                            controller: satuanController,
                            focusNode: satuanFocusNode,
                            textInputAction: TextInputAction.next,
                            decoration: input('Satuan'),
                            onFieldSubmitted: (value) {
                              Focus.of(context).requestFocus(jumlahFocusNode);
                            },
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 35,
                          color: Colors.blue.shade50,
                          child: TextFormField(
                            controller: nilaiController,
                            focusNode: jumlahFocusNode,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: input('Jumlah'),
                            onFieldSubmitted: (value) {
                              Focus.of(context)
                                  .requestFocus(tombolCatatFocusNode);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    ElevatedButton(
                      focusNode: tombolCatatFocusNode,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(280)),
                      onPressed: () {
                        ref
                            .read(pengeluaranListProvider.notifier)
                            .addPengeluaran(
                              '$uuid',
                              int.parse(nomorNotaController.text),
                              dateController.text,
                              qtyController.text,
                              keteranganController.text,
                              'buah',
                              nilaiController.text,
                              null,
                            );
                      },
                      child: const Text('Catat'),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
