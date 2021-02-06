import 'package:api_newsapp_with_bloc_v2/model/article_response.dart';
import 'package:api_newsapp_with_bloc_v2/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetTopHeadLinesBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();
  getHeadline() async {
    ArticleResponse response = await _repository.getTopHeadLines();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final getTopHeadLinesBloc = GetTopHeadLinesBloc();
