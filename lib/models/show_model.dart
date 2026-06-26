class ShowModel {
  final int id;
  final String name;
  final String language;
  final List<String> genres;
  final String status;
  final int? averageRuntime;
  final String premiered;
  final String? ended;
  final String? officialSite;
  final RatingModel rating;
  final NetworkModel? network;
  final ImageModel image;
  final String summary;

  const ShowModel({
    required this.id,
    required this.name,
    required this.language,
    required this.genres,
    required this.status,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.rating,
    required this.network,
    required this.image,
    required this.summary,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      id: json['id'] as int,
      name: json['name'] as String,
      language: json['language'] as String,
      genres: List<String>.from(json['genres']),
      status: json['status'] as String,
      averageRuntime: (json['averageRuntime'] as num?)?.toInt(),
      premiered: json['premiered'] as String,
      ended: json['ended'] as String?,
      officialSite: json['officialSite'] as String?,
      rating: RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      network: json['network'] != null
          ? NetworkModel.fromJson(json['network'] as Map<String, dynamic>)
          : null,
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String,
    );
  }

  String get cleanSummary {
    return summary.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  static List<ShowModel> listFromJson(List<dynamic> list) {
    return list
        .map((show) => ShowModel.fromJson(show as Map<String, dynamic>))
        .toList();
  }
}

class RatingModel {
  final double? average;

  const RatingModel({this.average});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(average: (json['average'] as num?)?.toDouble());
  }
}

class NetworkModel {
  final String? name;

  const NetworkModel({this.name});

  factory NetworkModel.fromJson(Map<String, dynamic> json) {
    return NetworkModel(name: json['name'] as String?);
  }
}

class ImageModel {
  final String medium;
  final String original;

  const ImageModel({required this.medium, required this.original});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      medium: json['medium'] as String,
      original: json['original'] as String,
    );
  }
}
