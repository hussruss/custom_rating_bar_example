import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_rating_bar_example/custom_rating_bar_example.dart';

void main() {
  testWidgets('CustomRatingBar', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CustomRatingBar(),
    ));

    final cont = find.byType(Container);
  });
}
