import 'package:fastkes_app/widgets/hospital_tile.dart';
import 'package:fastkes_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../widgets/transparent_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pickup_input_page.dart';

class PickHospitalPage extends StatelessWidget {
  final Color dividerColor = Color(0xff636464);

  static const _initialCameraPosition = CameraPosition(
      target: LatLng(-6.389965886184355, 106.83993210880122), zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(title: 'Pilih Fasilitas Kesehatan'),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.green[400],
              child: Text('Map'),
            ),

            // TODO: Bikin function supaya langsung center Mapsnya ke User location
            // child: GoogleMap(
            //   initialCameraPosition: _initialCameraPosition,
            //   myLocationButtonEnabled: false,
            //   zoomControlsEnabled: false,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SearchBar(
              hintString: 'Cari rumah sakit',
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: dividerColor,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return HospitalTile(
                    index: index,
                    showIcon: false,
                    onUserInput: () {
                      //TODO: Update hospital code in order vm
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PickUpInputPage(),
                        ),
                      );
                    },
                  );
                },
                itemCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
