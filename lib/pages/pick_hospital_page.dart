import 'package:fastkes_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/transparent_appbar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickHospitalPage extends StatelessWidget {
  final Color dividerColor = Color(0xff636464);

  // static const _initialCameraPosition = CameraPosition(
  //     target: LatLng(-6.389965886184355, 106.83993210880122), zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(
        title: 'Order Ambulance',
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.green[400],
              child: Text('Map'),
            ),
            // child: GoogleMap(
            //   initialCameraPosition: _initialCameraPosition,
            //   myLocationButtonEnabled: false,
            //   zoomControlsEnabled: false,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48),
            child: SearchBar(),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: dividerColor,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hospital',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Subtitle',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xff636464),
                            ),
                          ),
                        ),
                      ],
                    ),
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
