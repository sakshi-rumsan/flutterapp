import 'package:flutter/material.dart';

class Arithmetic extends StatefulWidget {
  const Arithmetic({Key? key}) : super(key: key);

  @override
  State<Arithmetic> createState() => _ArithmeticState();
}

class _ArithmeticState extends State<Arithmetic> {
  String firstNumber = '';
  String secondNumber = '';
  String result = '';
  String selectedFruit = 'Apple'; // Default selected fruit

  void calculateResult(String operation) {
    if (firstNumber.isEmpty || secondNumber.isEmpty) {
      setState(() {
        result = 'Please enter both numbers';
      });
      return;
    }

    int num1 = int.tryParse(firstNumber) ?? 0;
    int num2 = int.tryParse(secondNumber) ?? 0;
    int output;

    switch (operation) {
      case 'add':
        output = num1 + num2;
        break;
      case 'subtract':
        output = num1 - num2;
        break;
      case 'multiply':
        output = num1 * num2;
        break;
      case 'divide':
        if (num2 == 0) {
          setState(() {
            result = 'Cannot divide by zero';
          });
          return;
        }
        output = num1 ~/ num2;
        break;
      default:
        output = 0;
    }

    setState(() {
      result = output.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              const Text(
                'sakshi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 27, 171, 19), // Dark background for app bar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              
              Text(
                'Select a Fruit:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900], // Dark text color
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'Apple',
                    groupValue: selectedFruit,
                    onChanged: (value) {
                      setState(() {
                        selectedFruit = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Apple',
                    style: TextStyle(fontSize: 16),
                  ),
                  Radio(
                    value: 'Banana',
                    groupValue: selectedFruit,
                    onChanged: (value) {
                      setState(() {
                        selectedFruit = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Banana',
                    style: TextStyle(fontSize: 16),
                  ),
                  Radio(
                    value: 'Orange',
                    groupValue: selectedFruit,
                    onChanged: (value) {
                      setState(() {
                        selectedFruit = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Orange',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'First number',
                  filled: true,
                  fillColor: Colors.grey[200], // Light background for text field
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    firstNumber = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Second number',
                  filled: true,
                  fillColor: Colors.grey[200], // Light background for text field
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    secondNumber = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => calculateResult('add'),
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Green button color
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => calculateResult('subtract'),
                    child: Text('Subtract'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red button color
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => calculateResult('multiply'),
                    child: Text('Multiply'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Orange button color
                      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => calculateResult('divide'),
                    child: Text('Divide'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue button color
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Result: $result',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900], // Dark text color
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white, // Light background color
      ),
    );
  }
}
