import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/news/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({Key? key, required this.model}) : super(key: key);
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(21, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 0)),
        ],
      ),
      child: Column(
  
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            model.photo ?? "",
            fit: BoxFit.cover,
            height: 90,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
            child: Text(
              model.name ?? "",
              style: const TextStyle(color: Colors.black, fontSize: 13),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 16),
            child: Text(
              model.description ?? '',
              style: const TextStyle(fontSize: 10, color: Colors.black),
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
