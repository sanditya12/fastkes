import 'dart:convert';
import 'package:fastkes_app/models/hospital.dart';
import 'package:fastkes_app/models/order.dart';
import 'package:fastkes_app/models/pick_hospital.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter/material.dart';

class WebService {
  Future<List<PickHospitalModel>> getNearbyHospital(
      double lat, double long) async {
    String latLong = '$lat,$long';

    Map data = {"alamat": latLong};

    String body = json.encode(data);

    var url = Uri.parse('https://fastkes.herokuapp.com/findNearbyHospitals');

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    List list = jsonDecode(response.body);

    return list
        .map((hospital) => PickHospitalModel.fromJSON(hospital))
        .toList();
  }

  void addOrder(OrderModel order) async {
    Map data = {
      "no_telp": order.customerNumber,
      "alamat": order.customerAddress,
      "kode_rumah_sakit": order.hospitalCode,
      "nama": order.customerName,
    };

    String body = json.encode(data);

    var url = Uri.parse('https://fastkes.herokuapp.com/addOrder');

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    print(response.statusCode);

    // List list = jsonDecode(response.body);
  }

  Future<List<HospitalModel>> getHospitalList() async {
    String url = 'http://fastkes.herokuapp.com/hospitals';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      List list = result;

      return list.map((hospital) => HospitalModel.fromJSON(hospital)).toList();
    } else {
      throw Exception('Failed to get News');
    }
  }

  void launchURL(BuildContext context, String url) async {
    try {
      await launch(
        '$url',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: false,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
