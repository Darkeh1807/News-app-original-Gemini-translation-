import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/views/book_mark.dart';
import 'package:provider/provider.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;
  const NewsDetailPage({
    super.key,
   required this.news
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
                   news.urlToImage.toString(),
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
                    news.title,
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
                    news.content,
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
