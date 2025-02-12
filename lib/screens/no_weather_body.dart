import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.81,
        child: Text(
          'Sorry, There is no weather. Search now',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
