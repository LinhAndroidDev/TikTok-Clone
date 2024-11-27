import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_account_check.svg
  SvgGenImage get icAccountCheck =>
      const SvgGenImage('assets/images/ic_account_check.svg');

  /// File path: assets/images/ic_account_uncheck.svg
  SvgGenImage get icAccountUnCheck =>
      const SvgGenImage('assets/images/ic_account_uncheck.svg');

  /// File path: assets/images/ic_creative_light.svg
  SvgGenImage get icCreativeLight =>
      const SvgGenImage('assets/images/ic_creative_light.svg');

  /// File path: assets/images/ic_creative_dark.svg
  SvgGenImage get icCreativeDark =>
      const SvgGenImage('assets/images/ic_creative_dark.svg');

  /// File path: assets/images/ic_home_check.svg
  SvgGenImage get icHomeCheck =>
      const SvgGenImage('assets/images/ic_home_check.svg');

  /// File path: assets/images/ic_home_uncheck.svg
  SvgGenImage get icHomeUnCheck =>
      const SvgGenImage('assets/images/ic_home_uncheck.svg');

  /// File path: assets/images/ic_inbox_check.svg
  SvgGenImage get icInboxCheck =>
      const SvgGenImage('assets/images/ic_inbox_check.svg');

  /// File path: assets/images/ic_inbox_uncheck.svg
  SvgGenImage get icInboxUnCheck =>
      const SvgGenImage('assets/images/ic_inbox_uncheck.svg');

  /// File path: assets/images/ic_inbox_thin.svg
  SvgGenImage get icInboxThin =>
      const SvgGenImage('assets/images/ic_inbox_thin.svg');

  /// File path: assets/images/ic_search_check.svg
  SvgGenImage get icSearchCheck =>
      const SvgGenImage('assets/images/ic_search_check.svg');

  /// File path: assets/images/ic_search_uncheck.svg
  SvgGenImage get icSearchUnCheck =>
      const SvgGenImage('assets/images/ic_search_uncheck.svg');

  /// File path: assets/images/avatar1.png
  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/images/avatar1.png');

  /// File path: assets/images/avatar2.png
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/images/avatar2.png');

  /// File path: assets/images/ic_favourite.svg
  SvgGenImage get icFavourite =>
      const SvgGenImage('assets/images/ic_favourite.svg');

  /// File path: assets/images/ic_favourite_stroke.svg
  SvgGenImage get icFavouriteStroke =>
      const SvgGenImage('assets/images/ic_favourite_stroke.svg');

  /// File path: assets/images/ic_message.svg
  SvgGenImage get icMessage =>
      const SvgGenImage('assets/images/ic_message.svg');

  /// File path: assets/images/ic_music.svg
  SvgGenImage get icMusic =>
      const SvgGenImage('assets/images/ic_music.svg');

  /// File path: assets/images/ic_share.svg
  SvgGenImage get icShare =>
      const SvgGenImage('assets/images/ic_share.svg');

  /// File path: assets/images/video1.png
  AssetGenImage get video1 =>
      const AssetGenImage('assets/images/video1.png');

  /// File path: assets/images/video2.png
  AssetGenImage get video2 =>
      const AssetGenImage('assets/images/video2.png');

  /// File path: assets/images/ic_disc.svg
  SvgGenImage get icDisc =>
      const SvgGenImage('assets/images/ic_disc.svg');

  /// File path: assets/images/ic_avatar_music.png
  AssetGenImage get icAvatarMusic =>
      const AssetGenImage('assets/images/ic_avatar_music.png');

  /// File path: assets/images/ic_emotion.svg
  SvgGenImage get icEmotion =>
      const SvgGenImage('assets/images/ic_emotion.svg');

  /// File path: assets/images/ic_tag.svg
  SvgGenImage get icTag =>
      const SvgGenImage('assets/images/ic_tag.svg');

  /// File path: assets/images/ic_send.svg
  SvgGenImage get icSend =>
      const SvgGenImage('assets/images/ic_send.svg');

  /// File path: assets/images/ic_triangle.svg
  SvgGenImage get icTriangle =>
      const SvgGenImage('assets/images/ic_triangle.svg');

  List<dynamic> get values => [
    icAccountCheck,
    icAccountUnCheck,
    icCreativeLight,
    icCreativeDark,
    icHomeCheck,
    icHomeUnCheck,
    icInboxCheck,
    icInboxUnCheck,
    icInboxThin,
    icSearchCheck,
    icSearchUnCheck,
    avatar1,
    avatar2,
    icFavourite,
    icFavouriteStroke,
    icMessage,
    icMusic,
    icShare,
    video1,
    video2,
    icDisc,
    icAvatarMusic,
    icEmotion,
    icTag,
    icSend,
    icTriangle
  ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}