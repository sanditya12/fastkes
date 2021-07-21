import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/home_page.dart';
import './viewmodels/hospitals_list_vm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HospitalsListViewModel>(
      create: (_) => HospitalsListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FASTKES',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffF7FAF9),
          primaryColor: Color(0xffCD5D67),
          accentColor: Color(0xffF1D0D3),
          appBarTheme: AppBarTheme(
            elevation: 0, // This removes the shadow from all App Bars.
            backgroundColor: Colors.transparent,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
