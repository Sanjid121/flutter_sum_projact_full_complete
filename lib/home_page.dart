import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
// TextEditingController num1controlar = TextEditingController();
// TextEditingController num2controlar = TextEditingController();

class _HomePageState extends State<HomePage> {
  Map<String, double> Fromvalue = {'numer1': 0, 'numer2': 0, 'numer3': 0};
  double sum = 0;
  @override
  Widget build(BuildContext context) {
    myinputonchyng(inputkey, inputvalue) {
     
      setState(() {
        double? newValue = double.tryParse(inputvalue.trim());
       Fromvalue.update(inputkey, (value) => newValue ?? 0.0);
      });
    }

    addnum() {
      setState(() {
              sum = Fromvalue["numer1"]! + Fromvalue["numer2"]! + Fromvalue["numer3"]!;

      });
    
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sum App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              'Sum App=$sum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (Value) {
                      myinputonchyng('numer1', Value);
                    },
                    mouseCursor: SystemMouseCursors.click,
                    decoration: InputDecoration(
                        labelText: 'Fest Number', border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      myinputonchyng('numer2', value);
                    },
                    mouseCursor: SystemMouseCursors.click,
                    decoration: InputDecoration(
                        labelText: 'Second Number',
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      myinputonchyng('numer3', value);
                    },
                    mouseCursor: SystemMouseCursors.click,
                    decoration: InputDecoration(
                        labelText: '3rd Number', border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    addnum();
                  },
                  child: Text('Add')),
            )
          ],
        ),
      ),
    );
  }
}
