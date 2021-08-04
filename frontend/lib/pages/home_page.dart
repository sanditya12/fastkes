import 'package:fastkes_app/pages/hospitals_page.dart';

import 'package:flutter/material.dart';

import '../widgets/fastkes_logo.dart';
import '../widgets/order_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch (_index) {
      case 0:
        child = HospitalsView();
        break;

      case 1:
        child = HomeView();
        break;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_sharp),
            label: 'Hospitals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
        ],
        currentIndex: _index,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: child,
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FastkesLogo(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: OrderButton(),
          ),
        ],
      ),
    );
  }
}
