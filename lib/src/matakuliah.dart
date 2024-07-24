class Matakuliah {
  final int id;
  final String nama;
  final String kode;
  final String hari;
  final String jam;
  final String dosen;
  final int sks;

  const Matakuliah({
    required this.id,
    required this.nama,
    required this.kode,
    required this.hari,
    required this.jam,
    required this.dosen,
    required this.sks,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kode': kode,
      'hari': hari,
      'jam': jam,
      'dosen': dosen,
      'sks': sks
    };
  }

  factory Matakuliah.fromJson(Map<String, dynamic> json) {
    return Matakuliah(
      id: json['id'],
      nama: json['nama'],
      kode: json['kode'],
      hari: json['hari'],
      jam: json['jam'],
      dosen: json['dosen'],
      sks: json['sks'],
    );
  }
}
