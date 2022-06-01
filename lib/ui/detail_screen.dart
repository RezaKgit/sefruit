import 'package:sefruit/data/fruit.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Fruit fruit;
  const DetailScreen({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Character'),
      ),
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset(fruit.image)
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fruit.nama, textAlign: TextAlign.justify, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                      const SizedBox(height: 10),
                      Text(fruit.desc, textAlign: TextAlign.justify, style: const TextStyle(color: Colors.white)),
                      const SizedBox(height: 8),
                      Text(fruit.manfaat, textAlign: TextAlign.justify, style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}