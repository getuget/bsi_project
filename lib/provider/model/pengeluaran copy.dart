import 'dart:convert';

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
  final int? id;
  final int? nomor;
  final String tanggal;
  final String? banyaknya;
  final String? keterangan;
  final String? satuan;
  final String? nilai;
  final String? jumlah;
  Pengeluaran({
    this.id,
    this.nomor,
    required this.tanggal,
    this.banyaknya,
    this.keterangan,
    this.satuan,
    this.nilai,
    this.jumlah,
  });

  Pengeluaran copyWith({
    int? id,
    int? nomor,
    String? tanggal,
    String? banyaknya,
    String? keterangan,
    String? satuan,
    String? nilai,
    String? jumlah,
  }) {
    return Pengeluaran(
      id: id ?? this.id,
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
