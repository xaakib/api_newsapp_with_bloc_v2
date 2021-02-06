import 'package:api_newsapp_with_bloc_v2/model/article_response.dart';
import 'package:api_newsapp_with_bloc_v2/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final NewsRepository _newsRepository = NewsRepository();

  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  getSources(String value) async {
    ArticleResponse response = await _newsRepository.getSearch(value);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}

final searchBloc = SearchBloc();
