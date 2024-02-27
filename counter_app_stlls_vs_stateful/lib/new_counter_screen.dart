import 'package:counter_app_stlls_vs_stateful/cubit/counter_cubit.dart';
import 'package:counter_app_stlls_vs_stateful/cubit/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewCounterCubit(),
      child: BlocConsumer<NewCounterCubit, CounterStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
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
                      TextButton(
                        onPressed: () {
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
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    NewCounterCubit.get(context).reset();
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        }, //end builder
      ),
    );
  }
}
