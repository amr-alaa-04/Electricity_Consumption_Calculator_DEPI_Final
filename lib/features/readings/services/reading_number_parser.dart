enum ReadingNumberParseFailure {
  noNumberFound,
  multipleNumbersFound,
  invalidDecimalExpression,
  numberOutOfRange,
}

typedef ReadingNumberParseResult = ({
  bool succeeded,
  num? value,
  ReadingNumberParseFailure? failureReason,
});

/// Extracts one numeric electricity reading from Arabic or English text.
///
/// Supports ASCII, Arabic-Indic, and Persian digits, decimal points, and the
/// spoken decimal markers `فاصلة`, `point`, and `decimal`. Number words and
/// grouped thousands separators are intentionally not interpreted.
class ReadingNumberParser {
  const ReadingNumberParser();

  static final _numberPattern = RegExp(r'\d+(?:\.\d+)?');
  static final _decimalMarkerPattern = RegExp(
    r'(?<![a-z])(?:point|decimal)(?![a-z])|(?<![\u0600-\u06FF])فاصلة(?![\u0600-\u06FF])',
  );
  static final _malformedDottedNumberPattern = RegExp(
    r'(?<!\d)\d+(?:\.\d+){2,}(?!\d)|(?<!\d)\d+\.\.\d+(?!\d)|(?<!\d)\.\d+',
  );
  static final _separatorPattern = RegExp(
    r"""^[\s,;:،؛!?()\[\]{}"'“”‘’]*$""",
  );

  ReadingNumberParseResult parse(String input) {
    final normalized = _normalizeDigits(input).toLowerCase();
    if (_malformedDottedNumberPattern.hasMatch(normalized)) {
      return _failure(ReadingNumberParseFailure.invalidDecimalExpression);
    }

    final numbers = _numberPattern.allMatches(normalized).toList();
    if (numbers.isEmpty) {
      return _failure(ReadingNumberParseFailure.noNumberFound);
    }

    final decimalPairs = <(int, int)>[];
    for (final marker in _decimalMarkerPattern.allMatches(normalized)) {
      final previousIndex = _numberBefore(numbers, marker.start);
      final nextIndex = _numberAfter(numbers, marker.end);
      final previousIsAdjacent =
          previousIndex != null &&
          _hasOnlySeparators(
            normalized,
            numbers[previousIndex].end,
            marker.start,
          );
      final nextIsAdjacent =
          nextIndex != null &&
          _hasOnlySeparators(
            normalized,
            marker.end,
            numbers[nextIndex].start,
          );

      // A marker used next to a number must join two whole-number parts.
      // Otherwise the phrase is incomplete or malformed.
      if (!previousIsAdjacent && !nextIsAdjacent) continue;
      if (!previousIsAdjacent || !nextIsAdjacent) {
        return _failure(ReadingNumberParseFailure.invalidDecimalExpression);
      }

      final whole = numbers[previousIndex].group(0)!;
      final fractional = numbers[nextIndex].group(0)!;
      if (whole.contains('.') || fractional.contains('.')) {
        return _failure(ReadingNumberParseFailure.invalidDecimalExpression);
      }

      if (decimalPairs.any(
        (pair) =>
            pair.$1 == previousIndex ||
            pair.$2 == previousIndex ||
            pair.$1 == nextIndex ||
            pair.$2 == nextIndex,
      )) {
        return _failure(ReadingNumberParseFailure.invalidDecimalExpression);
      }
      decimalPairs.add((previousIndex, nextIndex));
    }

    final consumedNumberIndexes = <int>{
      for (final pair in decimalPairs) ...[pair.$1, pair.$2],
    };
    final values = <String>[];

    for (final pair in decimalPairs) {
      values.add('${numbers[pair.$1].group(0)}.${numbers[pair.$2].group(0)}');
    }
    for (var index = 0; index < numbers.length; index++) {
      if (!consumedNumberIndexes.contains(index)) {
        values.add(numbers[index].group(0)!);
      }
    }

    if (values.length > 1) {
      return _failure(ReadingNumberParseFailure.multipleNumbersFound);
    }

    final value = _parseNumber(values.single);
    if (value == null) {
      return _failure(ReadingNumberParseFailure.numberOutOfRange);
    }

    return (succeeded: true, value: value, failureReason: null);
  }

  static int? _numberBefore(List<RegExpMatch> numbers, int position) {
    for (var index = numbers.length - 1; index >= 0; index--) {
      if (numbers[index].end <= position) return index;
    }
    return null;
  }

  static int? _numberAfter(List<RegExpMatch> numbers, int position) {
    for (var index = 0; index < numbers.length; index++) {
      if (numbers[index].start >= position) return index;
    }
    return null;
  }

  static bool _hasOnlySeparators(String text, int start, int end) =>
      start <= end && _separatorPattern.hasMatch(text.substring(start, end));

  static String _normalizeDigits(String input) {
    final normalized = StringBuffer();
    for (final rune in input.runes) {
      if (rune >= 0x0660 && rune <= 0x0669) {
        normalized.writeCharCode(rune - 0x0660 + 0x30);
      } else if (rune >= 0x06F0 && rune <= 0x06F9) {
        normalized.writeCharCode(rune - 0x06F0 + 0x30);
      } else {
        normalized.writeCharCode(rune);
      }
    }
    return normalized.toString();
  }

  static num? _parseNumber(String input) {
    if (input.contains('.')) {
      final value = double.tryParse(input);
      return value != null && value.isFinite ? value : null;
    }
    return int.tryParse(input);
  }

  static ReadingNumberParseResult _failure(
    ReadingNumberParseFailure reason,
  ) => (succeeded: false, value: null, failureReason: reason);
}
