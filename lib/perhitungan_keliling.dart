import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class perhitunganKeliling extends StatefulWidget {
  const perhitunganKeliling({Key? key}) : super(key: key);

  @override
  State<perhitunganKeliling> createState() => _perhitunganKelilingState();
}

class _perhitunganKelilingState extends State<perhitunganKeliling> {
  final _formKey = GlobalKey<FormState>();
  double nilaiA = 0;
  double nilaiB = 0;
  double nilaiC = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keliling"),
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
                        nilaiA = double.parse(txt);
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "Masukan Nilai Sisi A",
                        labelText: "Sisi A",
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
                        nilaiB = double.parse(txt);
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "Masukan Nilai Sisi B",
                        labelText: "Sisi B",
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
                        nilaiC = double.parse(txt);
                      });
                    },
                    decoration: new InputDecoration(
                        hintText: "Masukan Nilai Sisi C",
                        labelText: "Sisi C",
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
                  builder: (BuildContext) => new hasilKeliling(
                      sisiA: nilaiA, sisiB: nilaiB, sisiC: nilaiC),
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

class hasilKeliling extends StatelessWidget {
  hasilKeliling(
      {required this.sisiA, required this.sisiB, required this.sisiC});
  final double sisiA;
  final double sisiB;
  final double sisiC;
  var hasil;

  @override
  Widget build(BuildContext context) {
    double hasil = (sisiA + sisiB + sisiC);
    return Scaffold(
        appBar: AppBar(
          title: Text("Hasil Keliling Segitiga"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                'Hasil Dari Keliling Segitiga',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                '$hasil',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ));
  }
}
