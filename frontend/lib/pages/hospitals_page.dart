import 'package:flutter/material.dart';
import '../widgets/hospitals_list.dart';

import '../widgets/search_bar.dart';
import '../widgets/transparent_appbar.dart';

class HospitalsPage extends StatelessWidget {
  HospitalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: 'Rumah Sakit',
      ),
      body: HospitalsView(),
    );
  }
}

class HospitalsView extends StatelessWidget {
  const HospitalsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(
          hintString: 'Cari rumah sakit',
          usage: 'hospital_list_input',
        ),
        HospitalsList(),
      ],
    );
  }
}
