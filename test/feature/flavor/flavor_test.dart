import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/feature/flavor/flavor.dart';
import 'package:template_app/util/firebase_option/firebase_options_dev.dart'
    as dev_options;
import 'package:template_app/util/firebase_option/firebase_options_prod.dart'
    as prod_options;

void main() {
  group('firebaseOptions', () {
    test('dev', () {
      // * Arrange & Act
      final actual = Flavor.dev.firebaseOptions;
      final expected = dev_options.DefaultFirebaseOptions.currentPlatform;

      // * Assert
      expect(actual, expected);
    });

    test('prod', () {
      // * Arrange & Act
      final actual = Flavor.prod.firebaseOptions;
      final expected = prod_options.DefaultFirebaseOptions.currentPlatform;

      // * Assert
      expect(actual, expected);
    });
  });
}
