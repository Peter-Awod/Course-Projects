import 'package:collected_projects/shared/components/components.dart';
import 'package:collected_projects/shared/cubit/news_cubit.dart';
import 'package:collected_projects/shared/cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      listener: (context,state){},
      builder: (context,state){

        var list=NewsCubit.get(context).business;

        return articleBuilder(list,context);

      },
    );
  }
}
