import 'package:fastkes_app/viewmodels/order_vm.dart';
import 'package:fastkes_app/viewmodels/pick_hospital_page_vm.dart';
import 'package:fastkes_app/widgets/hospital_tile.dart';
// import 'package:fastkes_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/transparent_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickHospitalPage extends StatefulWidget {
  @override
  _PickHospitalPageState createState() => _PickHospitalPageState();
}

class _PickHospitalPageState extends State<PickHospitalPage> {
  @override
  void initState() {
    super.initState();
    final orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    final pickHospitalViewModel =
        Provider.of<PickHospitalPageViewModel>(context, listen: false);

    pickHospitalViewModel.populateList(
      orderViewModel.getLat(),
      orderViewModel.getLong(),
    );
  }

  final Color dividerColor = Color(0xff636464);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<OrderViewModel>(context);
    final pageViewModel = Provider.of<PickHospitalPageViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(title: 'Pilih Fasilitas Kesehatan'),
      body: Column(
        children: [
          Expanded(
            // flex: 1,
            // child: Container(
            //   width: double.infinity,
            //   color: Colors.green[400],
            //   child: Text('Map'),
            // ),

            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  model.getLat(),
                  model.getLong(),
                ),
                zoom: 16,
              ),
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   child: SearchBar(
          //     hintString: 'Cari rumah sakit',
          //     usage: 'hospital_input',
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: dividerColor,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return pageViewModel.getDistance(index) != -1
                      ? HospitalTile(
                          index: index,
                          showIcon: false,
                          hospitalName: pageViewModel.getAddress(index),
                          distance: pageViewModel.getDistance(index),
                          onUserInput: () {
                            //* UPDATE ORDER VM
                            model
                                .updateHospitalCode(pageViewModel.getId(index));

                            //* NAVIGATE TO NEXT PAGE
                            Navigator.popAndPushNamed(
                              context,
                              '/confirm_order_page',
                            );
                          },
                        )
                      : Container();
                },
                itemCount: pageViewModel.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
