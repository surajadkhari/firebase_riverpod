import 'package:firebase_riverpod/import_packages.dart/import.dart';
import 'package:firebase_riverpod/provider/feed_provider.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
        leading: GestureDetector(
            onTap: () {
              context.refresh(fetchFeedProvider);
            },
            child: Icon(Icons.refresh)),
      ),
      body: Consumer(builder: (context, watch, child) {
        return watch(fetchFeedProvider).when(
            data: (feedData) {
              return ListView.builder(
                  itemCount: feedData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Text(feedData[index].title.toString()),
                        Image.network(feedData[index].image.toString()),
                        Text(feedData[index].description.toString())
                      ]),
                    );
                  });
            },
            loading: () => CircularProgressIndicator(),
            error: (error, stackTrace) {
              return Text(error.toString());
            });
      }),
    );
  }
}
