import 'package:flutter/material.dart';
import 'package:new_app/constants/colors.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/widgets/news_card.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  var isLoaded = false;
  void showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Heyyo'),
          content: const Text('Long press to remove'),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text('Close')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text("Bookmark"),
        actions: [
          Consumer<NewsProvider>(builder: (context, data, child) {
            return IconButton(
                onPressed: () {
                  data.removeAll();
                },
                icon: const Icon(
                  Icons.delete,
                ));
          })
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text("Note: Hold to delete"),
                    ),
                    Expanded(
                      child: Consumer<NewsProvider>(
                        builder: (context, data, child) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: ListView.builder(
                              itemCount: data.totalNews,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                final posts = data.news[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InkWell(
                                    onLongPress: () {
                                      data.removeNews(posts);
                                    },
                                    child: NewsCard(
                                      newsImg: posts.urlToImage!,
                                      newsTitle: posts.title,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
