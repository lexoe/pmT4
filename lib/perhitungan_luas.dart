import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class perhitunganLuas extends StatefulWidget {
  const perhitunganLuas({Key? key}) : super(key: key);

  @override
  State<perhitunganLuas> createState() => _perhitunganLuasState();
}

class _perhitunganLuasState extends State<perhitunganLuas> {
  final _formKey = GlobalKey<FormState>();

  double nilaiAlas = 0;
  double nilaiTinggi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menghitung Luas"),
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (txt) {
                      setState(() {
                        nilaiTinggi = double.parse(txt);
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "Masukan Nilai Tinggi",
                        labelText: "Nilai Tinggi",
                        icon: Icon(Icons.numbers)),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-z A-Z ,]'))],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill the form';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    onChanged: (txt) {
                      setState(() {
                        nilaiAlas = double.parse(txt);
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "Masukan Nilai Alas",
                        labelText: "Nilai Alas",
                        icon: Icon(Icons.numbers)),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-z A-Z ,]'))],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill the form';
                      }
                      return null;
                    },
                  ),
                ],
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var route = new MaterialPageRoute(
                  builder: (BuildContext) =>
                      new hasilLuas(nAlas: nilaiAlas, nTinggi: nilaiTinggi),
                );
                Navigator.of(context).push(route);
              }
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}

class hasilLuas extends StatelessWidget {
  hasilLuas({required this.nAlas, required this.nTinggi});
  final double nAlas;
  final double nTinggi;
  var hasil;
  @override
  Widget build(BuildContext context) {
    double hasil = (1 / 2 * nAlas * nTinggi);
    return Scaffold(
        appBar: AppBar(
          title: Text("Hasil Luas Segitiga"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                'Hasil Dari Keliling Segitiga',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                '$hasil',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ));
  }
}
