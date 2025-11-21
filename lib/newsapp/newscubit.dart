import 'package:flutter_application_15cubit/newsapp/Data_jaom.dart';
import 'package:flutter_application_15cubit/newsapp/newstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class Newscubit extends Cubit<Newstates> {
  Newscubit() : super(NewsInitial());
  final Dio dio = Dio();
  final String path =
      'https://newsapi.org/v2/everything?q=tesla&from=2025-10-21&sortBy=publishedAt&apiKey=76673b1eeaf342f49e60cc66513519a3';
  void Getnews() async {
    try {
      emit(NewsLoading());
      final response = await dio.get(path);
      final news = Data_jaom.fromJson(response.data);
      emit(NewsLoaded(news));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
