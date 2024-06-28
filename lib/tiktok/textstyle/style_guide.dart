import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class StyleGuide {
  // 기본 스타일
  static TextStyle baseStyle() {
    return const TextStyle(
      fontSize: 14.0,
    );
  }

  // 타이틀 스타일
  static TextStyle titleStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size28,
      fontWeight: FontWeight.w800,
    );
  }

  // 서브타이틀 스타일
  static TextStyle subtitleStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size20,
      fontWeight: FontWeight.w800,
    );
  }

  // 설명 스타일
  static TextStyle explainStyle() {
    return baseStyle().copyWith(
      fontSize: 16.0,
      color: Colors.grey[600],
    );
  }

  // thread 타이틀 스타일
  static TextStyle threadTitleStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16 + Sizes.size2,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle threadBodyStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16 + Sizes.size2,
    );
  }

  static TextStyle threadRepliesLikeStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16 + Sizes.size2,
      color: Colors.grey[600],
    );
  }

  static TextStyle reportStyle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16 + Sizes.size2,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle listTileTitle() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle listTileSub() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    );
  }

  static TextStyle listTileFollower() {
    return baseStyle().copyWith(
      fontSize: Sizes.size16,
    );
  }

  static TextStyle profileBody() {
    return baseStyle().copyWith(
      fontSize: 16,
      color: Colors.black,
    );
  }

  static TextStyle customeStyle(
      double? fontSize, FontWeight? fontWeight, Color? color,) {
    return baseStyle().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
