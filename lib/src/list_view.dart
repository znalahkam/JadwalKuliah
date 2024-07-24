import 'package:flutter/material.dart';
import 'settings/settings_view.dart';
import 'matakuliah.dart';
import 'details_view.dart';

class MatakuliahListView extends StatelessWidget {
  const MatakuliahListView({
    super.key,
    this.items = const [
      Matakuliah(
          id: 1,
          nama: "Algoritma Pemograman",
          kode: "AP",
          hari: "Rabu",
          jam: "16.30 - 19.30",
          dosen: "Bu Devita",
          sks: 2),
      Matakuliah(
          id: 2,
          nama: "Perancangan Basis Data",
          kode: "BD",
          hari: "Rabu",
          jam: "19.30 - 21.30",
          dosen: "Pak Hariyanto",
          sks: 3),
      Matakuliah(
          id: 3,
          nama: "Pemograman Web",
          kode: "PW",
          hari: "Senin",
          jam: "19.30 - 21.30",
          dosen: "Bu Maria",
          sks: 2)
    ],
  });

  static const routeName = '/';

  final List<Matakuliah> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Kuliah'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'listView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.nama),
              leading: CircleAvatar(
                child: Text(item.kode),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                    context, MatakuliahDetailsView.routeName,
                    arguments: item.toJson());
              });
        },
      ),
    );
  }
}
