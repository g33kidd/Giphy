import './images.dart';

class GIF {
  final String id;
  final String type;
  final String slug;
  final String url;
  // final String bitlyUrl;
  // final String embedUrl;
  // final String username;
  // final String source;
  final String rating;
  // final String sourceTld;
  // final String sourcePostUrl;
  final String title;
  final Images images;

  // TODO: add the rest of the information here..
  // https://developers.giphy.com/docs/#schema-definitions

  GIF({
    this.id,
    this.type,
    this.slug,
    this.title,
    this.rating,
    this.url,
    this.images,
  });

  factory GIF.fromJson(Map<String, dynamic> json) {
    return GIF(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      rating: json['rating'],
      slug: json['slug'],
      images: Images.fromJson(json['images']),
    );
  }
}
