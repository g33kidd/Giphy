class Images {
  final FixedHeight fixedHeight;
  final FixedHeightStill fixedHeightStill;

  Images({
    this.fixedHeight,
    this.fixedHeightStill,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      fixedHeight: FixedHeight.fromJson(json['fixed_height']),
      fixedHeightStill: FixedHeightStill.fromJson(json['fixed_height_still']),
    );
  }
}

class FixedHeight {
  final String url;
  final double width;
  final double height;
  final int size;
  final String mp4;
  final String mp4Size;
  final String webp;
  final String webpSize;

  FixedHeight({
    this.url,
    this.width,
    this.height,
    this.size,
    this.mp4,
    this.mp4Size,
    this.webp,
    this.webpSize,
  });

  factory FixedHeight.fromJson(Map<String, dynamic> json) {
    return FixedHeight(
      url: json['url'],
      width: double.parse(json['width']),
      height: double.parse(json['height']),
      size: int.parse(json['size']),
      mp4: json['mp4'],
      mp4Size: json['mp4_size'],
      webp: json['webp'],
      webpSize: json['webp_size'],
    );
  }
}

class FixedHeightStill {
  final String url;
  final String width;
  final String height;

  FixedHeightStill({
    this.url,
    this.width,
    this.height,
  });

  factory FixedHeightStill.fromJson(Map<String, dynamic> json) {
    return FixedHeightStill(
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}
