import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsreader/api_services.dart';
import 'package:newsreader/designs/newsdetails.dart';
import 'package:newsreader/model/article_model.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  String date = DateFormat('yyyy-MM-d').format(DateTime.now());
  String time = DateFormat('HH:mm:ss').format(DateTime.now());

  List<String> descriptions = [
    "Jeremy Siegel says bitcoin's rush higher will fizzle out once people trust banks again",
    "Bitcoin notches 9-month high after inflation data bolsters speculation of smaller rate hike",
    "Bitcoin soars to a 9-month high after Credit Suisse takeover fails to calm banking fears",
    "Bitcoin plunges under \$20,000 to its lowest point in 2 months as Silvergate blow-up and bank fears rattle risk assets"
  ];

  List<String> images = [
    'images/img.png',
    'images/img_1.png',
    'images/img_2.png',
    'images/img_3.png'
  ];

  List<String> dates = ['2023-03-22', '2023-03-14', '2023-03-20', '2023-03-10'];
  List<String> times = ['13:39:59', '15:32:23', '13:46:19', '16:22:49'];
  
  Apiservice client = Apiservice();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70,
        title: Text('Daily News',
          style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white,letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
        body: FutureBuilder<List<Articles>>(
         future: client.getArticle(),
         builder: (BuildContext content,AsyncSnapshot<List<Articles>> snapshot) {
           if (snapshot.hasData) {
             return ListView.builder(
               shrinkWrap: true,
               itemCount: snapshot.data?.length,
               itemBuilder: (context, index) {
                 var articles = snapshot.data![index];
                 return GestureDetector(
                   onTap: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (content) =>
                             Newsdetails(article: articles)));
                   },
                   child: Padding(
                     padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                     child: Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: Colors.white,
                           boxShadow: [
                             BoxShadow(
                               offset: const Offset(1, 2),
                               color: Colors.grey.withOpacity(.4),
                               blurRadius: 1,
                             )
                           ]
                       ),


                       child: Expanded(
                         child: Row(
                           children: [
                             Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Image(
                                     image: snapshot.data![index].urlToImage == null?
                                     NetworkImage('https://media.istockphoto.com/id/1313303632/video/breaking-news-template-intro-for-tv-broadcast-news-show-program-with-3d-breaking-news-text.jpg?s=640x640&k=20&c=S0dTZp37XKVcCAnoguMnRatvv4Nkp2cjmA5aYOOrJs8='):
                                     NetworkImage(snapshot.data![index].urlToImage.toString()),
                                     width: 150,
                                     height: 130,
                                   ),
                                 ]
                             ),
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.only(
                                     right: 5, left: 8, top: 5, bottom: 5),
                                 child: Column(
                                   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment
                                       .center,
                                   children: [
                                     Text(snapshot.data![index].description
                                         .toString(),
                                       //textAlign: TextAlign.justify,
                                       style: TextStyle(fontSize: 15),
                                     ),
                                     SizedBox(height: 22,),
                                     Align(
                                       child: Text(snapshot.data![index].publishedAt
                                           .toString()),
                                     ),
                                   ],
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                 );
               },
             );
           }
    return Center(
    child: CircularProgressIndicator(),
);
}),
    );
    }
  }