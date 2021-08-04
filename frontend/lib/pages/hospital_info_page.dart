import 'package:fastkes_app/models/hospital.dart';
import 'package:fastkes_app/services/webservice.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class HospitalInfoPage extends StatelessWidget {
  HospitalInfoPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final HospitalModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff46161A), //change your color here
        ),
        title: Text(
          'Informasi',
          style: TextStyle(color: Color(0xff46161A)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rumah Sakit ${model.name}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(model.type),
                  SizedBox(height: 10),
                  Text(
                    'Alamat:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(model.address + ', ' + model.city),
                  SizedBox(height: 10),
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    model.email == '' ? '(Tidak memiliki email)' : model.email,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Telepon:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    model.phoneNumber == ''
                        ? '(Tidak memiliki nomor telepon)'
                        : model.phoneNumber,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Website:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(model.website == ''
                      ? '(Tidak memiliki website)'
                      : model.website),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        var pos = model.phoneNumber.lastIndexOf(',');
                        String result = (pos != -1)
                            ? model.phoneNumber.substring(0, pos)
                            : model.phoneNumber;
                        print(result);
                        UrlLauncher.launch("tel:$result");
                        print('call');
                      },
                      child: const Text('Telepon'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor),
                      ),
                      onPressed: model.website == ''
                          ? null
                          : () {
                              print(model.website);
                              String url =
                                  model.website.replaceAll('www', 'https://');
                              WebService().launchURL(context, url);
                            },
                      child: Text(
                        'Website',
                        style: TextStyle(
                          color: model.website == ''
                              ? Colors.grey
                              : Color(0xffCD5D67),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
