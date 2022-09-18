import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Blog {
  final String blogId;
  final String title;
  final String content;
  final String datetime;

  const Blog({
    required this.blogId,
    required this.title,
    required this.content,
    required this.datetime,
  });

  Map<String, dynamic> toJson() => {
        "blogId": blogId,
        "title": title,
        "content": content,
        "datetime": datetime,
      };

  static Blog fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Blog(
      blogId: snapshot["blogId"],
      title: snapshot["title"],
      content: snapshot["content"],
      datetime: snapshot["datetime"],
    );
  }
}
