import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_sqflite/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app_sqflite/modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app_sqflite/modules/new_tasks/new_tasks_screen.dart';
import 'package:todo_app_sqflite/shared/components/components.dart';
import 'package:todo_app_sqflite/shared/components/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  int currentIndex = 0;
  List<Map> tasks = [];

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDatabase();
  }

  late Database databaseVar;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),


      body: ConditionalBuilder(
        condition: tasks.length>0,
        builder: (context)=>screens[currentIndex],
        fallback: (context) =>Center(child: CircularProgressIndicator()),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if (formKey.currentState!.validate()) {
              insertIntoDatabase(
                title: titleController.text,
                time: timeController.text,
                date: dateController.text,
              ).then((value) {
                Navigator.pop(context);
                isBottomSheetShown = false;
                setState(() {
                  fabIcon = Icons.edit;
                });
              });
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
                                lastDate: DateTime.parse('2023-12-30'),
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
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            isBottomSheetShown = true;

            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(
          fabIcon,
        ),
      ),



      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline_outlined), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archived'),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'Name';
  }

  void createDatabase() async {
    databaseVar = await openDatabase('todo.db', version: 1,
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
      print('Database opened');

      getDataFromDatabase(database).then((value) {
        tasks = value;
      });
    });
  }

  Future insertIntoDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await databaseVar.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title , date , time , status) VALUES ("$title","$date","$time","New")')
          .then((value) {
        print('$value data added successfully');
      }).catchError((error) {
        print('Error ${error.toString()}');
      });
      return null;
    });
  }

//////
  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}
