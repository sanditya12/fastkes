import 'package:fastkes_app/services/map_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/transparent_appbar.dart';
import '../widgets/search_bar.dart';

import '../widgets/location_tile.dart';
import '../widgets/confirm_bottom_sheet.dart';
import '../viewmodels/pickup_input_vm.dart';

class PickUpInputPage extends StatelessWidget {
  final Color dividerColor = Color(0xff636464);

  PickUpInputPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(title: 'Lokasi Penjemputan'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SearchBar(
              hintString: 'Lokasi penjemputan',
              usage: 'pickup_input',
            ),
          ),
          MaterialButton(
            color: Color(0xFFFAFAFA),
            onPressed: () async {
              print('Lokasi saya');

              String currentLocation = await MapService().getCurrentLocation();

              List<String> location = currentLocation.split(',');

              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmBottomSheet(
                    address: 'Lokasi saya',
                    lat: double.parse(location[0]),
                    long: double.parse(location[1]),
                  );
                },
              );
            },
            highlightColor: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                children: [
                  Icon(
                    Icons.my_location_sharp,
                    color: Color(0xff46161A),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Lokasi saya',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 20),
                      color: Color(0xff46161A),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),

          //* LISTVIEW
          Consumer<PickupInputViewModel>(
            builder: (context, model, child) {
              return Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: dividerColor,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return LocationTile(
                        index: index,
                      );
                    },
                    itemCount: model.suggestionList.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
