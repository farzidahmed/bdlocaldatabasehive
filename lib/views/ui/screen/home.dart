import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _addtextController = TextEditingController();

  //List _country=["Bnagladesh","CHina","Japan"];

  Box? _countrybox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countrybox = Hive.box("country");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: _addtextController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    final userdata = _addtextController.text;
                    _countrybox!.add(userdata);
                    clear();
                  },
                  child: const Text('Add Data')),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                  child: ValueListenableBuilder(
                    valueListenable:Hive.box("country").listenable(),
                       builder: (context,box,widget){
                         return ListView.builder(
                             itemCount:_countrybox!.keys.toList().length,
                             itemBuilder: (context, index) {
                               return Card(
                                 child: ListTile(
                                   title: Text(_countrybox!.getAt(index).toString()),
                                 ),
                               );
                             });
                       }))
            ],
          ),
        ),
      ),
    );
  }
  void clear(){
    _addtextController.clear();
  }
}
