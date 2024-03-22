import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/services/translate_services.dart';
import 'package:new_app/views/book_mark.dart';
import 'package:provider/provider.dart';

class NewsDetailPage extends StatefulWidget {
  final News news;
  const NewsDetailPage({super.key, required this.news});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isLoading = false;
  String? frenchText = "";
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
                    data.addNews(widget.news);
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
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    final tc = await translateContent(
                        text: widget.news.content, language: "French");
                    if (tc.text != null && tc.text != "") {
                      setState(() {
                        isLoading = false;
                        frenchText = tc.text;
                      });
                    }
                  } catch (e) {
                    rethrow;
                  }
                },
                child: const Icon(Icons.translate_outlined),
              ),
              const SizedBox(
                width: 25,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.network(
                    widget.news.urlToImage.toString(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.news.title,
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
                    widget.news.content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("French translation",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? const Align(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Translating to French")
                                ],
                              ),
                            )
                          : Text(
                              frenchText.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                    ],
                  )
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
