import 'package:collected_projects/modules/news_app/business_screen/business_screen.dart';
import 'package:collected_projects/modules/news_app/science_screen/science_screen.dart';
import 'package:collected_projects/modules/news_app/sports_screen/sports_screen.dart';
import 'package:collected_projects/shared/cubit/news_states.dart';
import 'package:collected_projects/shared/network/remote/news_dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      getBusiness();
    }
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(BottomNavBarState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '4274512e4fbe47f6af22a2ba0c9f7dec',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);

        business = value.data['articles'];

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());

    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'Sports',
          'apiKey': '4274512e4fbe47f6af22a2ba0c9f7dec',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);

        sports = value.data['articles'];

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());

    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '4274512e4fbe47f6af22a2ba0c9f7dec',
        },
      ).then((value) {
        //print(value.data['articles'][0]['title']);

        science = value.data['articles'];

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  //////////////////////////////////////////////
//Search

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
