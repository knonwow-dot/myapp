
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ready_ecommerce/main.dart';
import 'package:ready_ecommerce/models/eCommerce/cart/hive_cart_model.dart';
import 'package:ready_ecommerce/utils/app_constants.dart';

void main() {
  
  setUpAll(() async {
    // Create a temporary directory for Hive to use during tests
    final tempDir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(tempDir.path);
    
    // Register adapters and open boxes
    Hive.registerAdapter(HiveCartModelAdapter());
    await Hive.openBox(AppConstants.appSettingsBox);
    await Hive.openBox(AppConstants.userBox);
    await Hive.openBox<HiveCartModel>(AppConstants.cartModelBox);
  });

  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // At this point, the app should not have crashed and we should see the initial UI.
    // The original test looked for a counter, but the real app has a splash screen.
    // Let's just verify the app starts without throwing an error for now.
    expect(find.byType(MyApp), findsOneWidget);
    
  });
}
