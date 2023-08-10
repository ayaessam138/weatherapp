import 'package:flutter/material.dart';

class weatherdeafultbody extends StatelessWidget {
  const weatherdeafultbody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('There is no weather , Start Searching Now'))
      ],
    );
  }
}
