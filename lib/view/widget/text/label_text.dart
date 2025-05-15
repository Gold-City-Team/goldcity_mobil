import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class LabelText extends StatelessWidget {
  final String text;
  final double? textLineHeight;
  final TextOverflow overflow;
  final FONT_SIZE fontSize;
  final APPLICATION_COLOR textColor;
  final TextAlign align;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? wordSpacing;

  const LabelText(
      {super.key,
      required this.text,
      this.fontSize = FONT_SIZE.BODY_LARGE,
      this.textColor = APPLICATION_COLOR.TITLE,
      this.overflow = TextOverflow.visible,
      this.align = TextAlign.left,
      this.textLineHeight = 1.5,
      this.fontWeight,
      this.wordSpacing = 1,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    var formattedText = parseMarkdown(text);
    final boldPattern = RegExp(r'<strong>(.*?)</strong>');
    final italicPattern = RegExp(r'<em>(.*?)</em>');
    final linkPattern = RegExp(r'<a href="(.*?)">(.*?)</a>');
    final spans = <TextSpan>[];

    int currentIndex = 0;

    void addSpan(String text, [TextStyle? style, String? link]) {
      if (text.isNotEmpty) {
        if (link != null) {
          spans.add(
            TextSpan(
              text: text,
              style: style,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(Uri.parse(link));
                },
            ),
          );
        } else {
          spans.add(TextSpan(text: text, style: style));
        }
      }
    }

    final matches = [
      ...boldPattern.allMatches(formattedText),
      ...italicPattern.allMatches(formattedText),
      ...linkPattern.allMatches(formattedText),
    ];
    matches.sort((a, b) => a.start.compareTo(b.start));

    for (final match in matches) {
      if (match.start > currentIndex) {
        addSpan(formattedText.substring(currentIndex, match.start));
      }

      if (boldPattern.hasMatch(match.group(0)!)) {
        addSpan(match.group(1)!, TextStyle(fontWeight: FontWeight.w700, height: 1.5, color: context.toColor(APPLICATION_COLOR.TITLE)));
      } else if (italicPattern.hasMatch(match.group(0)!)) {
        addSpan(match.group(1)!, TextStyle(fontStyle: FontStyle.italic));
      } else if (linkPattern.hasMatch(match.group(0)!)) {
        addSpan(
            match.group(2)!,
            TextStyle(
              color: context.toColor(APPLICATION_COLOR.GOLD),
            ),
            match.group(1)!);
      }

      currentIndex = match.end;
    }

    if (currentIndex < formattedText.length) {
      addSpan(formattedText.substring(currentIndex));
    }

    return RichText(
      overflow: overflow,
      textAlign: align,
      text: TextSpan(
          children: spans,
          style: context.toTextStyle(fontSize).copyWith(
                color: context.toColor(textColor),
                fontWeight: fontWeight,
                wordSpacing: wordSpacing,
                height: textLineHeight,
              )),
      maxLines: maxLines,
    );
  }

  String parseMarkdown(String input) {
    var processedLine = input;

    // Kalın metin
    final boldPattern = RegExp(r'\*(.*?)\*');
    processedLine = processedLine.replaceAllMapped(boldPattern, (match) {
      return '<strong>${match.group(1)}</strong>';
    });
    final italicPattern = RegExp(r'(\*|_)(.*?)\1');
    processedLine = processedLine.replaceAllMapped(italicPattern, (match) {
      return '<em>${match.group(2)}</em>';
    });
    final linkPattern = RegExp(r'\[(.*?)\]\((.*?)\)');
    processedLine = processedLine.replaceAllMapped(linkPattern, (match) {
      return '<a href="${match.group(2)}">${match.group(1)}</a>';
    });

    return processedLine;
  }
}
