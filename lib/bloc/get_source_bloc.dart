import 'package:api_newsapp_with_bloc_v2/model/source_response.dart';
import 'package:api_newsapp_with_bloc_v2/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceBloc {
  final NewsRepository _newsRepository = NewsRepository();

  final BehaviorSubject<SourceResponse> _subject =
      BehaviorSubject<SourceResponse>();

  getSources() async {
    SourceResponse response = await _newsRepository.getSources();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SourceResponse> get subject => _subject;
}

final getTopHeadLinesBloc = GetSourceBloc();
