// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Group 32.png
  AssetGenImage get group32 =>
      const AssetGenImage('assets/images/Group 32.png');

  /// File path: assets/images/Group 33.png
  AssetGenImage get group33 =>
      const AssetGenImage('assets/images/Group 33.png');

  /// File path: assets/images/Group 34.png
  AssetGenImage get group34 =>
      const AssetGenImage('assets/images/Group 34.png');

  /// File path: assets/images/Group_16.png
  AssetGenImage get group16 =>
      const AssetGenImage('assets/images/Group_16.png');

  /// File path: assets/images/Rectangle 12.jpg
  AssetGenImage get rectangle12Jpg =>
      const AssetGenImage('assets/images/Rectangle 12.jpg');

  /// File path: assets/images/Rectangle12.png
  AssetGenImage get rectangle12Png =>
      const AssetGenImage('assets/images/Rectangle12.png');

  /// File path: assets/images/Rectangle_11.jpg
  AssetGenImage get rectangle11Jpg =>
      const AssetGenImage('assets/images/Rectangle_11.jpg');

  /// File path: assets/images/Rectangle_11.png
  AssetGenImage get rectangle11Png =>
      const AssetGenImage('assets/images/Rectangle_11.png');

  /// File path: assets/images/Search-duotone.svg
  String get searchDuotone => 'assets/images/Search-duotone.svg';

  /// File path: assets/images/children.png
  AssetGenImage get children =>
      const AssetGenImage('assets/images/children.png');

  /// File path: assets/images/coffe.png
  AssetGenImage get coffe => const AssetGenImage('assets/images/coffe.png');

  /// File path: assets/images/dell.png
  AssetGenImage get dell => const AssetGenImage('assets/images/dell.png');

  /// File path: assets/images/dress.jpeg
  AssetGenImage get dress => const AssetGenImage('assets/images/dress.jpeg');

  /// File path: assets/images/durem.png
  AssetGenImage get durem => const AssetGenImage('assets/images/durem.png');

  /// File path: assets/images/joy.png
  AssetGenImage get joy => const AssetGenImage('assets/images/joy.png');

  /// File path: assets/images/lol.png
  AssetGenImage get lol => const AssetGenImage('assets/images/lol.png');

  /// File path: assets/images/mobile.png
  AssetGenImage get mobile => const AssetGenImage('assets/images/mobile.png');

  /// File path: assets/images/tshirt.jpeg
  AssetGenImage get tshirt => const AssetGenImage('assets/images/tshirt.jpeg');

  /// File path: assets/images/vern.png
  AssetGenImage get vern => const AssetGenImage('assets/images/vern.png');

  /// List of all assets
  List<dynamic> get values => [
    group32,
    group33,
    group34,
    group16,
    rectangle12Jpg,
    rectangle12Png,
    rectangle11Jpg,
    rectangle11Png,
    searchDuotone,
    children,
    coffe,
    dell,
    dress,
    durem,
    joy,
    lol,
    mobile,
    tshirt,
    vern,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/filter.svg
  String get filter => 'assets/svg/filter.svg';

  /// List of all assets
  List<String> get values => [filter];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
