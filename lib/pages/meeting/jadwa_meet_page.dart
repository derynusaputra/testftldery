import 'package:flutter/material.dart';

class JadwalMeetPage extends StatelessWidget {
  final _nameC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jadwal Ruang Meeting"),
          backgroundColor: Color(0xffECECEC),
        ),
        body: ListView(
          children: [
            TextFormField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText: 'Divisi',
                // hintText: 'Enter your name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText: 'Ruang Meeting',
                // hintText: 'Enter your name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText: 'Tanggal Meeting',
                // hintText: 'Enter your name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText: 'Waktu Mulai Meeting',
                // hintText: 'Enter your name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText: 'Waktu Selesai Meeting',
                // hintText: 'Enter your name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              controller: _nameC,
              decoration: InputDecoration(
                labelText: 'Jumlah Peserta',
                // hintText: 'Enter your name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.person),
              ),
            ),
          ],
        ));
  }
}
