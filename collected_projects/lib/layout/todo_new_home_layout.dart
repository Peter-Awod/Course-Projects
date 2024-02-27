import 'package:collected_projects/shared/components/components.dart';
import 'package:collected_projects/shared/cubit/todo_cubit.dart';
import 'package:collected_projects/shared/cubit/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ToDoNewHomeLayoutScreen extends StatelessWidget {
   ToDoNewHomeLayoutScreen({super.key});




   var scaffoldKey = GlobalKey<ScaffoldState>();
   var formKey = GlobalKey<FormState>();



   var titleController = TextEditingController();
   var timeController = TextEditingController();
   var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
        create: (BuildContext context)=>AppCubit()..createDatabase(),
      child: BlocConsumer <AppCubit,AppStates>
        (
          listener: ( context , state){
            if (state is AppInsertDatabaseState ){
              Navigator.pop(context);
            }
          },
          builder: (context, state){

            AppCubit cubit = AppCubit.get(context);

            return Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.teal[100],
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  cubit.titles[cubit.currentIndex],
                ),
              ),


              body: ConditionalBuilder(
                condition: state is! AppGetDatabaseLoadingState,
                builder: (context)=>cubit.screens[cubit.currentIndex],
                fallback: (context) =>Center(child: CircularProgressIndicator()),
              ),


              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertIntoDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                      );

                      //.then((value) {
                      //   Navigator.pop(context);
                      //   isBottomSheetShown = false;
                      //   // setState(() {
                      //   //   fabIcon =   Icons.edit;
                      //   // });
                      // });
                    }
                  } else {
                    scaffoldKey.currentState
                        ?.showBottomSheet(
                      /////////////////////////////////// title
                          (context) => Container(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextFormField(
                                    controller: titleController,
                                    type: TextInputType.text,
                                    label: 'Task title',
                                    prefix: Icons.title,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Title must not be empty';
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                ////////////////time
                                defaultTextFormField(
                                    controller: timeController,
                                    type: TextInputType.datetime,
                                    label: 'Task time',
                                    prefix: Icons.watch_later_outlined,
                                    onTap: () {
                                      showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text =
                                            value!.format(context);
                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Time must not be empty';
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                ////////////////date
                                defaultTextFormField(
                                    controller: dateController,
                                    type: TextInputType.datetime,
                                    label: 'Task date',
                                    prefix: Icons.calendar_today_outlined,
                                    onTap: () {
                                      showDatePicker(
                                         context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.parse('1990-12-30'),
                                        lastDate: DateTime.parse('2100-12-30'),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat().add_yMMMd().format(value!);
                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Date must not be empty';
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      elevation: 15,
                    )
                        .closed
                        .then((value) {
                      cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                    });
                    cubit.changeBottomSheetState(isShow: true, icon: Icons.add);

                    // setState(() {
                    //   fabIcon = Icons.add;
                    // });
                  }
                },
                child: Icon(
                  cubit.fabIcon,
                  color: Colors.blueGrey[100],
                ),
                backgroundColor: Colors.teal,
              ),



              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.teal,
                selectedItemColor: Colors.black45,
                unselectedItemColor: Colors.blueGrey[100],
                selectedLabelStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu_book_outlined,), label: 'Tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.check_circle_outline_outlined), label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.archive_outlined), label: 'Archived'),
                ],
              ),
            );
          },
      ),
    );
        
  }




}
