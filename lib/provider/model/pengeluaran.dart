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
  final int id;
  final int? nomor;
  final String tanggal;
  final String? banyaknya;
  final String? keterangan;
  final String? satuan;
  final String? nilai;
  final String? jumlah;

  const Pengeluaran({
    required this.id,
    this.nomor,
    required this.tanggal,
    this.banyaknya,
    this.keterangan,
    this.satuan,
    this.nilai,
    this.jumlah,
  });

  Map<String, dynamic> toJson() => {
        PengeluaranFields.id: id,
        PengeluaranFields.nomor: nomor,
        PengeluaranFields.tanggal: tanggal,
        PengeluaranFields.banyaknya: banyaknya,
        PengeluaranFields.keterangan: keterangan,
        PengeluaranFields.satuan: satuan,
        PengeluaranFields.nilai: nilai,
        PengeluaranFields.jumlah: jumlah
      };
}
