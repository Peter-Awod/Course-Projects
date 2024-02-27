import 'package:collected_projects/modules/news_app/search_screen/search_screen.dart';
import 'package:collected_projects/shared/components/components.dart';
import 'package:collected_projects/shared/cubit/news_cubit.dart';
import 'package:collected_projects/shared/cubit/news_main_cubit.dart';
import 'package:collected_projects/shared/cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsHomeLayout extends StatelessWidget {
  const NewsHomeLayout({super.key});



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        NewsCubit varCubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
                'News App'
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search,),
              ),
              IconButton(
                onPressed: (){
                  MainCubit.get(context).changeAppMode();
                },
                icon: const Icon(Icons.brightness_4_outlined,),
              ),
            ],
          ),

          body: varCubit.screens[varCubit.currentIndex],


          bottomNavigationBar: BottomNavigationBar(
            currentIndex: varCubit.currentIndex,
            onTap: (index){
              varCubit.changeIndex(index);
            },
            items: varCubit.items,
          ),
        );
      },
    );
  }
}
