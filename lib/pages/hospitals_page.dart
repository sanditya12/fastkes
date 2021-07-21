import 'package:flutter/material.dart';
import '../widgets/hospitals_list.dart';

import '../widgets/search_bar.dart';
import '../widgets/transparent_appbar.dart';

class HospitalsPage extends StatelessWidget {
  HospitalsPage({Key? key}) : super(key: key);
  final Color blackColor = Color(0xff46161A);
  final Color dividerColor = Color(0xff636464);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        textColor: blackColor,
        title: 'Rumah Sakit',
      ),
      body: Column(
        children: [
          SearchBar(),
          HospitalsList(),
        ],
      ),
    );
  }
}
