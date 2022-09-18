import 'package:flutter/material.dart';

class BlogCardItem extends StatefulWidget {
  final snap;
  const BlogCardItem({Key? key, required this.snap}) : super(key: key);

  @override
  State<BlogCardItem> createState() => _BlogCardItemState();
}

class _BlogCardItemState extends State<BlogCardItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(Icons.short_text),
                SizedBox(
                  width: 20,
                ),
                Text(
                  " ${widget.snap['title']} - ${widget.snap['datetime']} ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
              Text(" ${widget.snap['content']}"),
            ],
          ),
        ),
      ),
    );
  }
}
