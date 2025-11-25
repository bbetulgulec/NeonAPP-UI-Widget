import 'package:flutter/material.dart';

class Steppers extends StatefulWidget {
  const Steppers({super.key, required this.title});
  final String title;
  @override
  State<Steppers> createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  int _currentStep = 0;
  int value = 0;
  final int minValue = 0;
  final int maxValue = 50;
  final int step = 5;

  void increment() {
    setState(() {
      if (value + step <= maxValue) value += step;
    });
  }

  void decrement() {
    setState(() {
      if (value - step >= minValue) value -= step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              "Current value: $value",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepContinue: () {
                increment();
                if (_currentStep < ((maxValue - minValue) ~/ step)) {
                  setState(() => _currentStep += 1);
                }
              },
              onStepCancel: () {
                decrement();
                if (_currentStep > 0) setState(() => _currentStep -= 1);
              },
              controlsBuilder: (context, details) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text("+5"),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text("-5"),
                    ),
                  ],
                );
              },
              steps: List.generate(
                ((maxValue - minValue) ~/ step) + 1,
                (index) => Step(
                  title: Text("Step ${index + 1}"),
                  content: const SizedBox.shrink(),
                  isActive: _currentStep == index,
                  state: _currentStep > index
                      ? StepState.complete
                      : StepState.indexed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
