import 'package:bsi_project/presentation/pages/pages/tabs/pemasukan_jelekong.dart';
import 'package:bsi_project/presentation/pages/pages/tabs/pengeluaran_jelekong.dart';
import 'package:flutter/material.dart';

class ProyekJelekong extends StatefulWidget {
  const ProyekJelekong({super.key});

  @override
  State<ProyekJelekong> createState() => _ProyekJelekongState();
}

class _ProyekJelekongState extends State<ProyekJelekong> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Proyek Jelekong'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'pemasukan'),
              Tab(text: 'pengeluaran'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          PemasukanJelekong(),
          PengeluaranJelekong(),
        ]),
      ),
    );
  }
}
