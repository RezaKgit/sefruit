import 'package:flutter/material.dart';
import 'package:sefruit/data/fruit.dart';
import 'package:sefruit/ui/detail_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController textController = TextEditingController();
  late List<Fruit> listFruit;

  @override
  void initState() {
    super.initState();
    listFruit = fruit_list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SeFruit"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context){
                return [
                  const PopupMenuItem(
                      value: 0,
                      child: Text('Sort ASC'),
                  ),
                  const PopupMenuItem(
                      value: 1,
                      child: Text('Sort DESC'),
                  )
                ];
              },
            onSelected: (value){
              if(value == 0){
                fruit_list.sort((a, b) => a.nama.compareTo(b.nama));
                setState(() {
                  listFruit = fruit_list;
                });
              } else if(value == 1) {
                fruit_list.sort((a, b) => b.nama.compareTo(a.nama));
                setState(() {
                  listFruit = fruit_list;
                });
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: fruit_list.map((fruit) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailScreen(fruit: fruit);
                      }));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 25,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Image.asset(fruit.image, width: 150, height: 150,),
                            )
                          ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(fruit.nama),
                            )
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
