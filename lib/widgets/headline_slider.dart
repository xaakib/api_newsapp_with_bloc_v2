import 'package:api_newsapp_with_bloc_v2/elements/error_element.dart';
import 'package:api_newsapp_with_bloc_v2/elements/loader_elements.dart';
import 'package:api_newsapp_with_bloc_v2/model/article.dart';
import 'package:api_newsapp_with_bloc_v2/model/article_response.dart';
import 'package:flutter/material.dart';
import 'package:api_newsapp_with_bloc_v2/bloc/get_top_headline_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:timeago/timeago.dart' as timeago;

class HeadlineSliderWidget extends StatefulWidget {
  @override
  _HeadlineSliderWidgetState createState() => _HeadlineSliderWidgetState();
}

class _HeadlineSliderWidgetState extends State<HeadlineSliderWidget> {
  @override
  void initState() {
    super.initState();
    getTopHeadLinesBloc.getHeadline();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
      stream: getTopHeadLinesBloc.subject.stream,
      builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildHeadlineSlider(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoaderWidget();
        }
      },
    );
  }

  Widget _buildHeadlineSlider(ArticleResponse data) {
    List<ArticleModel> article = data.articles;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          height: 200,
          viewportFraction: 0.9,
        ),
        items: getExpenseSliders(article),
      ),
    );
  }

  getExpenseSliders(List<ArticleModel> articles) {
    return articles
        .map(
          (article) => GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 5.0,
                right: 5.0,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              //  article.img == null
                              // ? AssetImage("assetName")
                              // :
                              NetworkImage(article.img)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [
                              0.1,
                              0.9,
                            ],
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.white.withOpacity(0.0),
                            ])),
                  ),
                  Positioned(
                    bottom: 30,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: 250,
                      child: Column(
                        children: [
                          Text(
                            article.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      article.source.name,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 9.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      timeAgo(DateTime.parse(article.date)),
                      style: TextStyle(
                        fontSize: 9.0,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }

  String timeAgo(date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
