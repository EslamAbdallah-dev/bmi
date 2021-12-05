// ignore_for_file: file_names

import 'dart:math';

import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ismale = true;
  double heightval = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  m1expanded(context, 'Male'),
                  const SizedBox(
                    width: 15,
                  ),
                  m1expanded(context, 'Female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$heightval',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'cm',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                    Slider(
                      value: heightval,
                      divisions: 120,
                      onChanged: (value) {
                        setState(() {
                          heightval = value;
                        });
                      },
                      min: 110,
                      max: 230,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  m2expanded(context, 'Weight'),
                  const SizedBox(
                    width: 15,
                  ),
                  m2expanded(context, 'Age'),
                ],
              ),
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightval / 100, 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultScr(
                          result: result, ismale: ismale, age: age);
                    }));
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )))
        ],
      )),
    );
  }

  Expanded m1expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = type == 'Male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (ismale && type == 'Male') || (!ismale && type == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'Male' ? Icons.male_rounded : Icons.female_rounded),
              const SizedBox(
                height: 10,
              ),
              Text(type == 'Male' ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.headline2)
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type == 'Weight' ? 'Weight' : 'Age',
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(
              height: 10,
            ),
            Text(type == 'Weight' ? '$weight' : '$age',
                style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'Weight' ? 'Weight--' : 'age--',
                  onPressed: () {
                    setState(() {
                      type == 'Weight' ? weight-- : age--;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 15,
                  ),
                  mini: true,
                ),
                FloatingActionButton(
                  heroTag: type == 'Weight' ? 'Weight++' : 'age++',
                  onPressed: () {
                    setState(() {
                      type == 'Weight' ? weight++ : age++;
                    });
                  },
                  child: const Icon(Icons.add, size: 15),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
