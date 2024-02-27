
import 'package:collected_projects/shared/cubit/counter_cubit.dart';
import 'package:collected_projects/shared/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


class NewCounterScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewCounterCubit() ,
      child: BlocConsumer < NewCounterCubit , CounterStates > (
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: ()
                  {
                    NewCounterCubit.get(context).decrease();
                  },
                    child: Text(
                      'Decrease',
                      style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${NewCounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),


                  TextButton(onPressed: ()
                  {
                    NewCounterCubit.get(context).increase();


                  },
                    child: Text(
                      'Increase',
                      style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );


        },//end builder

      ),
    );
  }
}
