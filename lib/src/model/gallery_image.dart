import '../service/gallery_download_service.dart';

class GalleryImage {
  String url;
  double? height;
  double? width;

  String? path;
  String? imageHash;
  DownloadStatus downloadStatus;

  GalleryImage({
    required this.url,
    this.height,
    this.width,
    this.imageHash,
    this.path,
    this.downloadStatus = DownloadStatus.none,
  });

  Map<String, dynamic> toJson() {
    return {
      "url": url,
      "height": height,
      "width": width,
      "imageHash": imageHash,
      "path": path,
      "downloadStatus": downloadStatus.index,
    };
  }

  factory GalleryImage.fromJson(Map<String, dynamic> json) {
    return GalleryImage(
      url: json["url"],
      height: json["height"],
      width: json["width"],
      imageHash: json["imageHash"],
      path: json["path"],
      downloadStatus: DownloadStatus.values[json["downloadStatus"]],
    );
  }

  GalleryImage copyWith({
    String? url,
    double? height,
    double? width,
    String? imageHash,
    String? path,
    DownloadStatus? downloadStatus,
  }) {
    return GalleryImage(
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
      imageHash: imageHash ?? this.imageHash,
      path: path ?? this.path,
      downloadStatus: downloadStatus ?? this.downloadStatus,
    );
  }

  @override
  String toString() {
    return 'GalleryImage{url: $url, height: $height, width: $width, imageHash: $imageHash, path: $path, downloadStatus: $downloadStatus}';
  }
}
