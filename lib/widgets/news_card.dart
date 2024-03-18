import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String newsImg;
  final String newsTitle;
  const NewsCard({Key? key, required this.newsImg, required this.newsTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            newsImg,
            width: double.infinity,
            height: 255,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container();
            },
          ),
        ),
        Positioned(
          top: 140,
          left: 18,
          child: Card(
            color: Colors.white,
            child: SizedBox(
              height: 95,
              width: 305,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    newsTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
