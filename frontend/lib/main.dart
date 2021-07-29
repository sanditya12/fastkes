import 'package:fastkes_app/pages/confirm_order_page.dart';
import 'package:fastkes_app/pages/pick_hospital_page.dart';
import 'package:fastkes_app/pages/pickup_input_page.dart';
import 'package:fastkes_app/viewmodels/pick_hospital_page_vm.dart';
import 'package:fastkes_app/viewmodels/pickup_input_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/home_page.dart';
import './viewmodels/hospitals_list_vm.dart';
import './viewmodels/order_vm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //* Providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HospitalsListViewModel>(
          create: (_) => HospitalsListViewModel(),
        ),
        ChangeNotifierProvider<PickupInputViewModel>(
          create: (_) => PickupInputViewModel(),
        ),
        ChangeNotifierProvider<OrderViewModel>(
          create: (_) => OrderViewModel(),
        ),
        ChangeNotifierProvider<PickHospitalPageViewModel>(
          create: (_) => PickHospitalPageViewModel(),
        ),
      ],

      // MATERIAL APP
      child: (MaterialApp(
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
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/pickup_page': (context) => PickUpInputPage(),
          '/choose_hospital_page': (context) => PickHospitalPage(),
          '/confirm_order_page': (context) => ConfirmOrderPage(),
        },
      )),
    );
  }
}
