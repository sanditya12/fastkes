import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../viewmodels/hospitals_list_vm.dart';
import 'hospital_tile.dart';

class HospitalsList extends StatelessWidget {
  final Color dividerColor = Color(0xff636464);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<HospitalsListViewModel>(
          builder: (context, model, child) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: dividerColor,
              ),
              itemBuilder: (BuildContext context, int index) {
                return HospitalTile(
                  index: index,
                );
              },
              itemCount: 20, // TODO: Replace with model.getLength
            );
          },
        ),
      ),
    );
  }
}
