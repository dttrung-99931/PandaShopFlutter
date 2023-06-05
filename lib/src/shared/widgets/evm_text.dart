import 'package:evievm_app/core/utils/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class EVMText extends StatelessWidget {
  const EVMText(this.text, {required this.style, this.overflow, this.textAlign, super.key});

  final String text;
  final TextStyle style;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final texts = _separateText();
    return Text.rich(
      TextSpan(
        children: texts.map((e) {
          return TextSpan(
            text: e.text,
            style: e.isArial ? style.arial().bold() : style.notoSansJP(),
          );
        }).toList(),
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  List<_EVMString> _separateText() {
    final result = <_EVMString>[];
    var token = '';
    var prevChar = '';
    for (var i = 0; i < text.length; i++) {
      final char = text[i];
      if (_isOpen(char)) {
        if (token.isNotEmpty) {
          result.add(_EVMString(token, _isArial(prevChar)));
          token = char;
          prevChar = '';
        } else {
          result.add(_EVMString(char, i < text.length - 1 ? _isArial(text[i + 1]) : false));
        }
      } else if (_isArial(char) == _isArial(prevChar) || _isSpace(char) || _isClose(char) || prevChar.isEmpty) {
        token += char;
      } else {
        result.add(_EVMString(token, _isArial(prevChar)));
        token = char;
      }
      if (!_isSpace(char) && !_isOpen(char) && !_isClose(char)) prevChar = char;
    }
    result.add(_EVMString(token, _isArial(prevChar)));
    return result;
  }

  bool _isArial(String char) {
    return '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.contains(char) && char.length == 1;
  }

  bool _isSpace(String char) {
    return ' /-_.,;:'.contains(char);
  }

  bool _isOpen(String char) {
    return '([{'.contains(char);
  }

  bool _isClose(String char) {
    return ')]}'.contains(char);
  }
}

class _EVMString {
  final String text;
  final bool isArial;

  _EVMString(this.text, this.isArial);
}
