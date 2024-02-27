import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collected_projects/shared/components/components.dart';
import 'package:collected_projects/shared/cubit/news_cubit.dart';
import 'package:collected_projects/shared/cubit/news_states.dart';

class SearchScreen extends StatelessWidget {


  var searchController =TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var list=NewsCubit.get(context).search;


        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search_outlined,
                  validate: (String? value)
                  {
                    if(value!.isEmpty){
                      return 'Search must not be empty';
                    }
                    else {
                      return null;
                    }
                  },
                  onChange: ( value){
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: articleBuilder(list, context,isSearch: true,),
              ),
            ],
          ),
        );
      },

    );
  }
}