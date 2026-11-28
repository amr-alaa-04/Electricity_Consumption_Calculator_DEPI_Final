import 'package:electricity_consumption_calculator/features/readings/services/reading_number_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const parser = ReadingNumberParser();

  group('Arabic and localized digits', () {
    test('extracts an Arabic-Indic integer from an Arabic sentence', () {
      final result = parser.parse('القراءة ١٢٣٤٥');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345);
      expect(result.failureReason, isNull);
    });

    test('extracts an Arabic decimal spoken with فاصلة', () {
      final result = parser.parse('القراءة ١٢٣٤٥ فاصلة ٦');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345.6);
    });

    test('normalizes Persian digits', () {
      final result = parser.parse('عدد العداد ۱۲۳۴۵');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345);
    });
  });

  group('English and decimal readings', () {
    test('extracts ASCII integer from an English sentence', () {
      final result = parser.parse('Meter reading is 12345');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345);
    });

    test('extracts a conventional decimal reading', () {
      final result = parser.parse('Meter reading is 12345.6');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345.6);
    });

    test('extracts a decimal spoken with point', () {
      final result = parser.parse('The reading is 12345 point 6');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345.6);
    });

    test('extracts a decimal spoken with decimal', () {
      final result = parser.parse('reading 12345 decimal 6');

      expect(result.succeeded, isTrue);
      expect(result.value, 12345.6);
    });

    test('allows leading and trailing words around one reading', () {
      final result = parser.parse('Please record meter reading 9876.25 today');

      expect(result.succeeded, isTrue);
      expect(result.value, 9876.25);
    });
  });

  group('failure cases', () {
    test('fails when no number is present', () {
      final result = parser.parse('Please record the meter reading');

      expect(result.succeeded, isFalse);
      expect(result.value, isNull);
      expect(result.failureReason, ReadingNumberParseFailure.noNumberFound);
    });

    test('fails on multiple independent numbers', () {
      final result = parser.parse('previous reading 123 and current reading 456');

      expect(result.succeeded, isFalse);
      expect(result.value, isNull);
      expect(result.failureReason, ReadingNumberParseFailure.multipleNumbersFound);
    });

    test('fails on an incomplete decimal expression', () {
      final result = parser.parse('Meter reading 123 point');

      expect(result.succeeded, isFalse);
      expect(result.failureReason, ReadingNumberParseFailure.invalidDecimalExpression);
    });

    test('fails on repeated decimal markers', () {
      final result = parser.parse('Meter reading 123 point point 6');

      expect(result.succeeded, isFalse);
      expect(result.failureReason, ReadingNumberParseFailure.invalidDecimalExpression);
    });

    test('fails on malformed dotted decimals', () {
      final result = parser.parse('Meter reading 123.4.5');

      expect(result.succeeded, isFalse);
      expect(result.failureReason, ReadingNumberParseFailure.invalidDecimalExpression);
    });

    test('fails on empty or whitespace-only input without throwing', () {
      for (final input in ['', '  \t\n ']) {
        final result = parser.parse(input);

        expect(result.succeeded, isFalse);
        expect(result.value, isNull);
        expect(result.failureReason, ReadingNumberParseFailure.noNumberFound);
      }
    });
  });
}
