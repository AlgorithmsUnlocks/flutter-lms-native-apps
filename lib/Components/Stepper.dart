import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {

  const MyStepper({Key? key}) : super(key: key);

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Our Online Payment Include'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Razor Pay Online Payments')),
        ),
        const Step(
          title: Text('Our Offline Payment Include'),
          content: Text('Not set !'),
        ),
      ],
    );
  }
}
