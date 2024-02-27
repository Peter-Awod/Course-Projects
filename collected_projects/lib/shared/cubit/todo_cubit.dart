import 'package:collected_projects/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:collected_projects/modules/done_tasks/done_tasks_screen.dart';
import 'package:collected_projects/modules/new_tasks/new_tasks_screen.dart';
import 'package:collected_projects/shared/cubit/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get (context)
  {
    return BlocProvider.of(context);
  }

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];





  void changeIndex(int index)
  {
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }


  late Database databaseVar;

  void createDatabase()  {
    openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
          print('Database created successfully');

          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
              .then((value) {
            print('Table created');
          }).catchError((error) {
            print('Error ${error.toString()}');
          });
        },
        onOpen: (database) {
          getDataFromDatabase(database);
          print('Database opened');

        }
        ).then((value) {
          databaseVar=value;
          emit(AppCreateDatabaseState());
    }
    );
  }

   insertIntoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
     await databaseVar.transaction((txn) async {
      txn
          .rawInsert(
          'INSERT INTO tasks (title , date , time , status) VALUES ("$title","$date","$time","New")')
          .then((value) {
        print('$value data added successfully');
        emit(AppInsertDatabaseState());

        getDataFromDatabase(databaseVar);

      }).catchError((error) {
        print('Error ${error.toString()}');
      });
      return null;
    });
  }

//////
  void getDataFromDatabase(database) {
    emit(AppGetDatabaseLoadingState());

    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
     database.rawQuery('SELECT * FROM tasks').then((value) {

       value.forEach((element)
       {
         if(element['status']=='New')
           {
             newTasks.add(element);
           }
         else if(element['status']=='Done')
         {
           doneTasks.add(element);
         }
         else {
           archivedTasks.add(element);
         }
       });

       emit(AppGetDatabaseState());


     });
  }

void updateDatabase({
    required String status,
    required int id,
}) async
{
   databaseVar.rawUpdate(
    'UPDATE tasks SET status = ? WHERE id = ?',
    ['$status','$id']
  ).then((value) {
    emit(AppUpdateDatabaseState());
     getDataFromDatabase(databaseVar);
   });
}


  void deleteDatabase({
    required int id,
  }) async
  {
    databaseVar.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        ['$id']
    ).then((value) {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(databaseVar);
    });
  }



  ////////
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
})
  {
    isBottomSheetShown =isShow;
    fabIcon =icon;
    emit(AppChangeBottomSheetState());
  }



}