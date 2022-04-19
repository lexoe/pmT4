import 'package:flutter/material.dart';
import 'package:tugas_4/perhitungan_luas.dart';
import 'package:tugas_4/perhitungan_keliling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List items = [
    "Luas",
    "Keliling",
  ];

  late var dataAwal;

  void prosesData() {
    if (dataAwal == "Luas") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => perhitunganLuas(),
          ));
    } else if (dataAwal == "Keliling") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => perhitunganKeliling(),
          ));
    }
  }

  @override
  void initState() {
    dataAwal = "Luas";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Yehovan Nugra Agave',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Teknik Informatika'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('20190801188'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Tugas 3"),
      ),
      body: ListView(
        children: [
          Container(
            child: const Text(
              "Perhitungan Segitiga",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: Padding(
                padding: EdgeInsets.all(30),
                child: DropdownButton(
                  value: dataAwal,
                  items: items
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e.toString()),
                          value: e.toString(),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      dataAwal = value;
                    });
                  },
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () => prosesData(),
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
