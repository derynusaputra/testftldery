import 'package:flutter/material.dart';

class BookingMeetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _nameC = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Booking Ruang Meeting"),
          backgroundColor: Color(0xffECECEC),
        ),
        body: ListView(
          children: [
            Text("Ruangan Meeting"),
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
          ],
        ));
  }
}
