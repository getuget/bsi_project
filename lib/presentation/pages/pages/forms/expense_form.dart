import 'package:bsi_project/provider/model/pengeluaran_copy_.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';

// import 'package:bsi_project/provider/model/pengeluaran.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class CopyFormJelekongOut extends HookConsumerWidget {
  const CopyFormJelekongOut({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final dateController = useTextEditingController();
    final keteranganController = useTextEditingController();
    final nilaiController = useTextEditingController();
    final qtyController = useTextEditingController();
    final satuanController = useTextEditingController();
    final nomorNotaController = useTextEditingController();

    final noNotaFocusNode = useFocusNode();
    final keteranganFocusNode = useFocusNode();
    final qtyFocusNode = useFocusNode();
    final satuanFocusNode = useFocusNode();
    final jumlahFocusNode = useFocusNode();
    final tombolCatatFocusNode = useFocusNode();

    final initialValue = DateTime.now();
    final format = DateFormat("dd MMM, yyyy  HH:mm");

    final idProvider = Provider<String>((ref) => Pengeluaran().id!);
    const uuid = Uuid();

    InputDecoration input(String labelName) {
      return InputDecoration(
          labelText: labelName,
          labelStyle: const TextStyle(fontSize: 13),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45)));
    }

    BoxDecoration boxDecoration() {
      return BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(4.0),
      );
    }

    final postPengeluaran = ref.watch(pengeluaranListProvider);
    final Object? list = ref.watch(pengeluaranProvider);
    final mmap = ref.watch(exMapProvider);

    return Dialog(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 25,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: boxDecoration(),
                                child: DateTimeField(
                                  format: format,
                                  readOnly: true,
                                  resetIcon: null,
                                  textAlign: TextAlign.center,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  initialValue: initialValue,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                  onSaved: (DateTime? d) {
                                    if (d != null) {
                                      dateController.text =
                                          "${d.day}-${d.month}-${d.year} \n ${d.hour}:${d.minute}";
                                      // print("HEADER DATETIME: ${ctrl.receiptDateController.text}");
                                    }
                                  },
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
                              const SizedBox(width: 5.0),
                              Container(
                                height: 25,
                                width: 100,
                                decoration: boxDecoration(),
                                child: TextField(
                                  autofocus: true,
                                  controller: nomorNotaController,
                                  focusNode: noNotaFocusNode,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Nomor Nota',
                                    labelStyle: TextStyle(
                                      color: noNotaFocusNode.hasFocus
                                          ? Colors.grey[700]
                                          : Colors.deepOrange,
                                      fontSize: 13,
                                      // decoration: TextDecoration()
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black45),
                                    ),
                                  ),
                                  onSubmitted: (value) {
                                    // Focus.of(context)
                                    keteranganFocusNode.requestFocus();
                                  },
                                ),
                              ),
                            ],
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 450,
                    minHeight: 70,
                  ),
                  child: RawScrollbar(
                    controller: scrollController,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Keterangan')),
                        DataColumn(label: Text('Qty')),
                        DataColumn(label: Text('Satuan')),
                        DataColumn(label: Text('Harga')),
                        DataColumn(label: Text('Jumlah')),
                      ],
                      rows: postPengeluaran
                          .map((e) => DataRow(
                                cells: [
                                  DataCell(Text(e.keterangan!)),
                                  DataCell(Text(e.banyaknya!)),
                                  DataCell(Text(e.satuan!)),
                                  DataCell(Text(e.nilai!)),
                                  DataCell(Text(e.jumlah!)),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
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
                    FocusScope(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 90,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              controller: keteranganController,
                              focusNode: keteranganFocusNode,
                              textInputAction: TextInputAction.next,
                              decoration: input('Keterangan'),
                              onFieldSubmitted: (value) {
                                qtyFocusNode.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              controller: qtyController,
                              focusNode: qtyFocusNode,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: input("Qty"),
                              onFieldSubmitted: (value) {
                                satuanFocusNode.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            width: 65,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              controller: satuanController,
                              focusNode: satuanFocusNode,
                              textInputAction: TextInputAction.next,
                              decoration: input('Satuan'),
                              onFieldSubmitted: (value) {
                                jumlahFocusNode.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              controller: nilaiController,
                              focusNode: jumlahFocusNode,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: input('Jumlah'),
                              onFieldSubmitted: (value) {
                                // Focus.of(context)
                                //     .requestFocus(tombolCatatFocusNode);
                                tombolCatatFocusNode.requestFocus();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                    ElevatedButton(
                      focusNode: tombolCatatFocusNode,
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: tombolCatatFocusNode.hasFocus
                          //     ? Colors.deepOrange
                          //     : null,
                          fixedSize: const Size.fromWidth(300)),
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
                        debugPrint('$pengeluaranListProvider');
                      },
                      child: const Text('Catat'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
