import 'dart:convert';

class course{
  final int? id;
  final String? title;
  final String? instructor;
  final String? imageURL;
  final String? videoUrl;

  course({
    this.id,
    this.title,
    this.instructor,
    this.imageURL,
    this.videoUrl,
  });
  coursecopyWith({
    int?id,
    String? title,
    String? instructor,
    String? imageURL,
    String? videoUrl,
  }) {
    return course(
      id: id?? this.id,
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      imageURL: imageURL ?? this.imageURL,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'title': title,
      'instructor': instructor,
      'imageURL': imageURL,
      'videoUrl': videoUrl
    };
  }

  factory course.fromMap(Map<String, dynamic> map) {
    return course(
      id: map['id'] !=null ? map['id'] as int :null,
      title: map['title'] != null ? map['title'] as String : null,
      instructor: map['instructor'] != null ? map['instructor'] as String : null,
      imageURL: map['imageURL'] != null ? map['imageURL'] as String : null,
      videoUrl:
          map['videoUrl'] != null ? map['videoUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory course.fromJson(String source) =>
      course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'course(id:$id, title: $title, instructor: $instructor, imageURL: $imageURL, videoUrl: $videoUrl)';
  }

  // @override
  // bool operator ==(covariant courseother) {
  //   if (identical(this, other)) return true;
  //   return other.title == title &&
  //       other.instructor == instructor &&
  //       other.imageURL == imageURL &&
  //       other.videoUrl == videoUrl
  // }

  @override
  int get hashCode {
    return id.hashCode^
          title.hashCode ^
        instructor.hashCode ^
        imageURL.hashCode ^
        videoUrl.hashCode;
  }
}
