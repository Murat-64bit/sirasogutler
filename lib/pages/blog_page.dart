import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sirasogutler/widgets/blog_card_item.dart';

class BlogPage extends StatefulWidget {
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Duyurular'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 27, 139, 31),
        ),
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('blog')
                .orderBy('datetime', descending: true)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              int a = (snapshot.data as dynamic).docs.length;
              return a == 0
                  ? Center(child: Text("Kayıtlı hiç bir işlem yok."))
                  : ListView.builder(
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot snap =
                          (snapshot.data! as dynamic).docs[index];

                      return BlogCardItem(snap: snap);
                    });
            }),
      ),
    );
  }
}
