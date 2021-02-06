import 'package:api_newsapp_with_bloc_v2/model/article_response.dart';
import 'package:api_newsapp_with_bloc_v2/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetHotNewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();
}
