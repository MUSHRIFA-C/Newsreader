import 'package:flutter/material.dart';
import 'package:newsreader/model/article_model.dart';

class Newsdetails extends StatelessWidget {


  final Articles article;

  Newsdetails({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: article.urlToImage==null ?
                    NetworkImage('https://media.istockphoto.com/id/1313303632/video/breaking-news-template-intro-for-tv-broadcast-news-show-program-with-3d-breaking-news-text.jpg?s=640x640&k=20&c=S0dTZp37XKVcCAnoguMnRatvv4Nkp2cjmA5aYOOrJs8=') :
                    NetworkImage(article.urlToImage.toString()),
                    fit: BoxFit.cover
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
            child: Text(article.title.toString(),style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
            child: Text(article.publishedAt.toString(),style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Author : ',textAlign: TextAlign.justify,style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.w600
                ),),
                Text(article.author.toString(),textAlign: TextAlign.justify,style: TextStyle(
                    fontSize: 14,fontWeight: FontWeight.w400
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Text(article.description.toString(),textAlign: TextAlign.justify,),
          ),
        ],
      ),
    );
  }
}