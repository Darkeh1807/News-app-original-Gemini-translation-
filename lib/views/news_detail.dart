import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/views/book_mark.dart';
import 'package:provider/provider.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class NewsDetailPage extends StatelessWidget {
  final String postImage;
  final String postTitle;
  final String postDetail;
  const NewsDetailPage({
    super.key,
    required this.postImage,
    required this.postTitle,
    required this.postDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              Consumer<NewsProvider>(builder: (context, data, child) {
                News news = News(
                  title: postTitle,
                  description: "",
                  urlToImage: postImage,
                  url: "",
                  publishedAt: DateTime.now(),
                  content: postDetail,
                );
                return IconButton(
                  onPressed: () {
                    data.addNews(news);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Post succesfully added to Bookmark"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.bookmark_outline),
                );
              }),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    PopupMenuButton(
                        itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                child: Text("Settings"),
                              ),
                              const PopupMenuItem(
                                child: Text("Settings"),
                              ),
                              const PopupMenuItem(
                                child: Text("Settings"),
                              )
                            ]);
                  },
                  child: const Icon(Icons.more_horiz)),
              const SizedBox(
                width: 25,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.network(
                    postImage,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: double.infinity,
                    color: Colors.black38,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    postTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    postDetail,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const BookmarkPage(),
            ),
          );
        },
        child: Consumer<NewsProvider>(
          builder: (context, value, child) {
            final allBookmarkedNews = value.totalNews;
            return Badge(
              label: Text("$allBookmarkedNews"),
              child: const Icon(Icons.bookmark),
            );
          },
        ),
      ),
    );
  }
}
