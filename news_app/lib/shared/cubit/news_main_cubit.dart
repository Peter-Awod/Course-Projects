import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/news_states.dart';
import 'package:news_app/shared/network/local/news_cache_helper.dart';
import 'package:news_app/shared/network/remote/news_dio_helper.dart';

class MainCubit extends Cubit<NewsStates> {
  MainCubit() : super(InitialNewsState());
  static MainCubit get(context) => BlocProvider.of(context);

bool isDark=false;

void changeAppMode({bool? fromShared})
{
  if(fromShared!=null)
    {
      isDark=fromShared;
      emit(ChangeAppModeState());
    }
  else {
    isDark =!isDark;
    CacheHelper.putData(key: 'isDark', value: isDark)
        .then((value) {
      emit(ChangeAppModeState());

    });
  }

}


  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '4274512e4fbe47f6af22a2ba0c9f7dec',
      },
    ).then((value) {

      search = value.data['articles'];

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }


}