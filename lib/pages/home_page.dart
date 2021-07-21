import 'package:flutter/material.dart';

import '../widgets/fastkes_logo.dart';
import '../widgets/order_button.dart';
import '../widgets/hospitals_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_sharp,
              color: Theme.of(context).primaryColor,
              size: 42,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FastkesLogo(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: OrderButton(),
              ),
              HospitalsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
