import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

class PengeluaranFields {
  static const String id = 'id';
  static const String nomor = 'nomor';
  static const String tanggal = 'tanggal';
  static const String banyaknya = 'banyaknya';
  static const String keterangan = 'keterangan';
  static const String satuan = 'satuan';
  static const String nilai = 'nilai';
  static const String jumlah = 'jumlah';

  static List<String> getFields() =>
      [id, nomor, tanggal, banyaknya, keterangan, satuan, nilai, jumlah];
}

class Pengeluaran {
  final String? id;
  final int? nomor;
  final String? tanggal;
  final String? banyaknya;
  final String? keterangan;
  final String? satuan;
  final String? nilai;
  final String? jumlah;
  Pengeluaran({
    this.id,
    this.nomor,
    this.tanggal,
    this.banyaknya,
    this.keterangan,
    this.satuan,
    this.nilai,
    this.jumlah,
  });

  Pengeluaran copyWith({
    String? id,
    int? nomor,
    String? tanggal,
    String? banyaknya,
    String? keterangan,
    String? satuan,
    String? nilai,
    String? jumlah,
  }) {
    return Pengeluaran(
      id: id ?? _uuid.v4(),
      nomor: nomor ?? this.nomor,
      tanggal: tanggal ?? this.tanggal,
      banyaknya: banyaknya ?? this.banyaknya,
      keterangan: keterangan ?? this.keterangan,
      satuan: satuan ?? this.satuan,
      nilai: nilai ?? this.nilai,
      jumlah: jumlah ?? this.jumlah,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomor': nomor,
      'tanggal': tanggal,
      'banyaknya': banyaknya,
      'keterangan': keterangan,
      'satuan': satuan,
      'nilai': nilai,
      'jumlah': jumlah,
    };
  }

  factory Pengeluaran.fromMap(Map<String, dynamic> map) {
    return Pengeluaran(
      id: map['id']?.toInt(),
      nomor: map['nomor']?.toInt(),
      tanggal: map['tanggal'] ?? '',
      banyaknya: map['banyaknya'],
      keterangan: map['keterangan'],
      satuan: map['satuan'],
      nilai: map['nilai'],
      jumlah: map['jumlah'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pengeluaran.fromJson(String source) =>
      Pengeluaran.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pengeluaran(id: $id, nomor: $nomor, tanggal: $tanggal, banyaknya: $banyaknya, keterangan: $keterangan, satuan: $satuan, nilai: $nilai, jumlah: $jumlah)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pengeluaran &&
        other.id == id &&
        other.nomor == nomor &&
        other.tanggal == tanggal &&
        other.banyaknya == banyaknya &&
        other.keterangan == keterangan &&
        other.satuan == satuan &&
        other.nilai == nilai &&
        other.jumlah == jumlah;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nomor.hashCode ^
        tanggal.hashCode ^
        banyaknya.hashCode ^
        keterangan.hashCode ^
        satuan.hashCode ^
        nilai.hashCode ^
        jumlah.hashCode;
  }
}

///
///
///
///
///
///
///

class PengeluaranList extends StateNotifier<List<Pengeluaran>> {
  PengeluaranList([List<Pengeluaran>? state]) : super(state ?? []);

  void addPengeluaran(
    String? id,
    int? nomor,
    String? tanggal,
    String? banyaknya,
    String? keterangan,
    String? satuan,
    String? nilai,
    String? jumlah,
  ) {
    state = [
      ...state,
      Pengeluaran(
        id: id!,
        nomor: nomor!,
        tanggal: tanggal!,
        banyaknya: banyaknya!,
        keterangan: keterangan!,
        satuan: satuan!,
        nilai: nilai!,
        jumlah: jumlah!,
      )
    ];
  }
}

// final pengeluaran = Provider<List<Pengeluaran>>((ref) => [Pengeluaran()]);

final pengeluaranProvider = StateNotifierProvider((ref) => PengeluaranList());

final pengeluaranListProvider =
    StateNotifierProvider<PengeluaranList, List<Pengeluaran>>((ref) {
  return PengeluaranList([
    Pengeluaran(
      id: _uuid.v4(),
      nomor: 01,
      tanggal: '24 Desember 2022',
      banyaknya: '0',
      keterangan: 'pasir',
      satuan: 'truk',
      nilai: '0',
      jumlah: '0',
    )
  ]);
});

class PengeluaranNotifier extends StateNotifier<Map<dynamic, Pengeluaran>> {
  PengeluaranNotifier() : super({});

  int pengeluaranLength() {
    return state.length;
  }

  void add(
    String? id,
    int? nomor,
    String? tanggal,
    String? banyaknya,
    String? keterangan,
    String? satuan,
    String? nilai,
    String? jumlah,
  ) {
    // if (!state.containsKey(_uuid)) {
    Map<dynamic, Pengeluaran> exMap = {
      id: Pengeluaran(
        id: id!,
        nomor: nomor!,
        tanggal: tanggal!,
        banyaknya: banyaknya!,
        keterangan: keterangan!,
        satuan: satuan!,
        nilai: nilai!,
        jumlah: jumlah!,
      )
    };
    state = {...state, ...exMap};
    // } else {
    //   state.update(
    //     _uuid,
    //     (existing) => Pengeluaran(
    //       id: existing.id!,
    //       nomor: existing.nomor!,
    //       tanggal: existing.tanggal!,
    //       banyaknya: existing.banyaknya!,
    //       keterangan: existing.keterangan!,
    //       satuan: existing.satuan!,
    //       nilai: existing.nilai!,
    //       jumlah: existing.jumlah!,
    //     ),
    //   );
    // }
  }
}

final exMapProvider =
    StateNotifierProvider<PengeluaranNotifier, Map<dynamic, Pengeluaran>>(
        (ref) => PengeluaranNotifier());

final idProvider = Provider((ref) => Pengeluaran().id);

final exNot = Provider((ref) => PengeluaranNotifier());
