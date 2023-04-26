import 'package:flutter/material.dart';

void main() => runApp(FibonacciApp());

class FibonacciApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci',
      home: FibonacciPage(),
    );
  }
}

class FibonacciPage extends StatefulWidget {
  @override
  _FibonacciPageState createState() => _FibonacciPageState();
}

class _FibonacciPageState extends State<FibonacciPage> {
  late int _fibonacciNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresa un Numero',
              ),
              onChanged: (value) {
                setState(() {
                  _fibonacciNumber = int.tryParse(value)!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (){
                if (_fibonacciNumber != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Resultado'),
                        content: Text(_calculateFibonacciSequence()),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Ingresa un número válido.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Resultado'),
            ),
          ],
        ),
      ),
    );
  }

  String _calculateFibonacciSequence() {
    if (_fibonacciNumber == 0) return '0';
    if (_fibonacciNumber == 1) return '0, 1';
    List<int> sequence = [0, 1];
    for (int i = 2; i <= _fibonacciNumber; i++) {
      sequence.add(sequence[i - 2] + sequence[i - 1]);
    }
    return sequence.join(', ');
  }
}