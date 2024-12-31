import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdatabasehive/app.dart';

 Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Box box = await Hive.openBox("country");
   box.put("name", "Bangladesh");
   print(box.get('name'));
  runApp(App());
}