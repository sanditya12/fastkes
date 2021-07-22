import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/transparent_appbar.dart';
import '../widgets/search_bar.dart';
import '../viewmodels/pickup_input_page_vm.dart';
import '../widgets/location_tile.dart';

class PickUpInputPage extends StatelessWidget {
  final Color dividerColor = Color(0xff636464);

  PickUpInputPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PickUpInputPageViewModel>(
      create: (_) => PickUpInputPageViewModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: TransparentAppBar(title: 'Lokasi Penjemputan'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SearchBar(
                hintString: 'Lokasi penjemputan',
              ),
            ),
            MaterialButton(
              color: Color(0xFFFAFAFA),
              onPressed: () {
                print('Lokasi saya');
                //TODO: Get location if the user doesnt type after 1 second
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

            //TODO: Change to show ListView only when SearchBar isnt empty
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: dividerColor,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return LocationTile();
                  },
                  itemCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
