import 'dart:math';
import 'package:flutter/material.dart';
import 'matakuliah.dart';

class MatakuliahDetailsView extends StatelessWidget {
  MatakuliahDetailsView({super.key});

  final Random random = Random();
  String getRandomImage() {
    return 'https://picsum.photos/id/${random.nextInt(1084)}/800/400';
  }

  static const routeName = '/matakuliah';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map<String, dynamic>;
    final matakuliah = Matakuliah.fromJson(arguments);
    return Scaffold(
        appBar: AppBar(
          title: Text(matakuliah.nama),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(getRandomImage()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailRow(
                        icon: Icons.code,
                        label: 'Kode Mata Kuliah',
                        value: matakuliah.kode),
                    DetailRow(
                        icon: Icons.book,
                        label: 'Nama Mata Kuliah',
                        value: matakuliah.nama),
                    DetailRow(
                        icon: Icons.calendar_today,
                        label: 'Hari Mata Kuliah',
                        value: matakuliah.hari),
                    DetailRow(
                        icon: Icons.access_time,
                        label: 'Waktu Mata Kuliah',
                        value: matakuliah.jam),
                    DetailRow(
                        icon: Icons.person,
                        label: 'Nama Dosen',
                        value: matakuliah.dosen),
                    DetailRow(
                        icon: Icons.star,
                        label: 'Jumlah SKS',
                        value: matakuliah.sks.toString()),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailRow(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}
