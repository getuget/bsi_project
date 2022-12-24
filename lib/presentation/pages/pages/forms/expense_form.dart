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
    // final scrollController = useScrollController();

    final dateController = useTextEditingController();
    final nomorNotaController = useTextEditingController();
    final keteranganController = useTextEditingController();
    final qtyController = useTextEditingController();
    final satuanController = useTextEditingController();
    final nilaiController = useTextEditingController();
    final jumlahController = useTextEditingController();

    final noNotaFocusNode = useFocusNode();
    final keteranganFocusNode = useFocusNode();
    final qtyFocusNode = useFocusNode();
    final satuanFocusNode = useFocusNode();
    final jumlahFocusNode = useFocusNode();
    final tombolCatatFocusNode = useFocusNode();

    final initialValue = DateTime.now();
    final format = DateFormat("dd MMM, yyyy  HH:mm");

    // final idProvider = Provider<String>((ref) => Pengeluaran().id!);
    // const uuid = Uuid();
    var _uuid = const Uuid();

    TextStyle formTextStyle() {
      return const TextStyle(
        overflow: TextOverflow.fade,
        fontSize: 13,
      );
    }

    InputDecoration input(String labelName) {
      return InputDecoration(
        labelText: labelName,
        labelStyle: const TextStyle(fontSize: 13),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45),
        ),
        contentPadding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
      );
    }

    BoxDecoration boxDecoration() {
      return BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(4.0),
      );
    }

    ConstrainedBox constrained(Widget child) {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 100,
          // maxHeight: 80,
        ),
        child: child,
      );
    }

    TextStyle labelStyle() {
      return TextStyle(
        color: Colors.grey[800],
        // letterSpacing: 0.5,
      );
    }

    final postPengeluaran = ref.watch(pengeluaranListProvider);
    // final Object? list = ref.watch(pengeluaranProvider);
    // final mmap = ref.watch(exMapProvider);

    int? noNota;
    int? jumlah;

    return Dialog(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                              letterSpacing: 1.0,
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
                                  style: formTextStyle(),
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
                                  onChanged: (val) {
                                    noNota = int.tryParse(val);
                                    debugPrint('$noNota');
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 450,
                    minHeight: 70,
                  ),
                  child: DataTable(
                    columnSpacing: 10,
                    dataRowHeight: 30,
                    headingRowHeight: 40,
                    showBottomBorder: true,
                    columns: [
                      DataColumn(
                          label: Text('Keterangan', style: labelStyle())),
                      DataColumn(label: Text('Qty', style: labelStyle())),
                      DataColumn(label: Text('Satuan', style: labelStyle())),
                      DataColumn(label: Text('Nilai', style: labelStyle())),
                      DataColumn(label: Text('Jumlah', style: labelStyle())),
                    ],
                    rows: postPengeluaran
                        .map((e) => DataRow(
                              cells: [
                                DataCell(constrained(Text(e.keterangan!))),
                                DataCell(constrained(Text(e.banyaknya!))),
                                DataCell(constrained(Text(e.satuan!))),
                                DataCell(constrained(Text(e.nilai!))),
                                DataCell(constrained(Text(e.jumlah!))),
                              ],
                            ))
                        .toList(),
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
                            width: 80,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              maxLines: 1,
                              controller: keteranganController,
                              focusNode: keteranganFocusNode,
                              textInputAction: TextInputAction.next,
                              decoration: input('Keterangan'),
                              style: formTextStyle(),
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
                              style: formTextStyle(),
                              onFieldSubmitted: (value) {
                                satuanFocusNode.requestFocus();
                              },
                              onChanged: (val) {
                                if (nilaiController.text.trim().isNotEmpty) {
                                  var x = int.tryParse(qtyController.text);
                                  var y = int.tryParse(nilaiController.text);
                                  jumlah = x! * y!;
                                  jumlahController.text = jumlah.toString();
                                }
                                debugPrint('Jumlah: $jumlah');
                              },
                            ),
                          ),
                          Container(
                            width: 55,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              controller: satuanController,
                              focusNode: satuanFocusNode,
                              textInputAction: TextInputAction.next,
                              decoration: input('Satuan'),
                              style: formTextStyle(),
                              onFieldSubmitted: (value) {
                                jumlahFocusNode.requestFocus();
                              },
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              controller: nilaiController,
                              focusNode: jumlahFocusNode,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: input('Nilai'),
                              style: formTextStyle(),
                              onFieldSubmitted: (value) {
                                tombolCatatFocusNode.requestFocus();
                              },
                              onChanged: (val) {
                                if (qtyController.text.trim().isNotEmpty) {
                                  var x = int.tryParse(qtyController.text);
                                  var y = int.tryParse(nilaiController.text);
                                  jumlah = x! * y!;
                                  jumlahController.text = jumlah.toString();
                                }
                                debugPrint('Jumlah: $jumlah');
                              },
                            ),
                          ),
                          Container(
                            width: 75,
                            height: 35,
                            decoration: boxDecoration(),
                            child: TextFormField(
                              readOnly: true,
                              controller: jumlahController,
                              focusNode: jumlahFocusNode,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: input('Jumlah'),
                              style: formTextStyle(),
                              onChanged: (val) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                    ElevatedButton(
                      focusNode: tombolCatatFocusNode,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(300)),
                      onPressed: () {
                        ref
                            .read(pengeluaranListProvider.notifier)
                            .addPengeluaran(
                              _uuid.v4(),
                              noNota!,
                              dateController.text,
                              qtyController.text,
                              keteranganController.text,
                              satuanController.text,
                              nilaiController.text,
                              jumlahController.text,
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
