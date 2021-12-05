import 'package:flutter/material.dart';

class ResultScr extends StatelessWidget {
  const ResultScr(
      {Key? key, required this.result, required this.ismale, required this.age})
      : super(key: key);
  final double result;
  final bool ismale;
  final int age;

  String get resultbmi {
    String resulttext = '';
    if (result >= 30) {
      resulttext = 'Obese';
    } else if (result > 25 && result < 30) {
      resulttext = 'OverWeight';
    } else if (result > 18.5 && result < 24.9) {
      resulttext = 'normal';
    } else {
      resulttext = 'Thin';
    }

    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your BMI Result'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender: ${ismale ? 'Male' : 'Female'}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Result: ${result.toStringAsFixed(1)}',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Healthiness: $resultbmi',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text(
              'Age: $age',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      )),
    );
  }
}
