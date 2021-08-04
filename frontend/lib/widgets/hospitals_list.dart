import 'package:fastkes_app/pages/hospital_info_page.dart';
import 'package:fastkes_app/widgets/hospital_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../viewmodels/hospitals_list_vm.dart';

class HospitalsList extends StatefulWidget {
  @override
  _HospitalsListState createState() => _HospitalsListState();
}

class _HospitalsListState extends State<HospitalsList> {
  final Color dividerColor = Color(0xff636464);

  @override
  void initState() {
    super.initState();
    final model = Provider.of<HospitalsListViewModel>(context, listen: false);
    model.populateList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),

        //* Consumer for HospitalListViewModel
        child: Consumer<HospitalsListViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: dividerColor,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return HospitalListTile(
                        index: index,
                        address: model.searchResult == []
                            ? (model.getAddress(index).length < 36
                                ? model.getAddress(index)
                                : model.getAddress(index).substring(0, 36))
                            : (model.searchResult[index].address.length < 36
                                ? model.searchResult[index].address
                                : model.searchResult[index].address
                                    .substring(0, 36)),
                        hospitalName:
                            'Rumah Sakit ${model.searchResult == [] ? model.getName(index) : model.searchResult[index].name}',
                        onUserInput: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HospitalInfoPage(
                                  model: model.searchResult == []
                                      ? model.hospitalsList[index]
                                      : model.searchResult[index]),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: model.searchResult == []
                        ? model.getLength()
                        : model.searchResult.length,
                  );
          },
        ),
      ),
    );
  }
}
