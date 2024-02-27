
import 'package:collected_projects/layout/news_app/news_home_layout.dart';
import 'package:collected_projects/modules/login/login_screen.dart';
import 'package:collected_projects/shared/bloc_observer.dart';
import 'package:collected_projects/shared/cubit/news_cubit.dart';
import 'package:collected_projects/shared/cubit/news_main_cubit.dart';
import 'package:collected_projects/shared/cubit/news_states.dart';
import 'package:collected_projects/shared/network/local/news_cache_helper.dart';
import 'package:collected_projects/shared/network/remote/news_dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/todo_new_home_layout.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/messenger/messenger_screen.dart';
import 'modules/new_messenger/new_messenger_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark =CacheHelper.getData(key: 'isDark');

  runApp(MyApp());
  // runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {


  // final bool isDark;
  // const MyApp(this.isDark, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()),
        BlocProvider(create: (BuildContext context) {
          return MainCubit()..changeAppMode(
            // fromShared: isDark,
          );
        },)
      ],
      child: BlocConsumer<MainCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade900,

                ),
                // systemOverlayStyle: SystemUiOverlayStyle(
                //   statusBarColor: Colors.white,
                //   statusBarIconBrightness: Brightness.dark,
                // ),
                iconTheme: const IconThemeData(
                  color: Colors.black,

                ),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 50,
                backgroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                bodySmall:TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: Colors.deepOrange

              ),


            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),

              appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  backgroundColor: HexColor('333739'),
                  elevation: 0,
                  titleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                  iconTheme: const IconThemeData(
                    color: Colors.white,

                  ),

                  // systemOverlayStyle: SystemUiOverlayStyle(
                  //   statusBarColor: HexColor('333739'),
                  //   statusBarIconBrightness: Brightness.light,
                  // )
              ),

              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),

              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 50,
                backgroundColor: HexColor('333738'),
              ),

              textTheme: const TextTheme(
                bodySmall:TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              progressIndicatorTheme: const ProgressIndicatorThemeData(
                  color: Colors.deepOrange

              ),

            ),
            themeMode: MainCubit.get(context).isDark ?ThemeMode.dark : ThemeMode.light ,



            home: LoginScreen(),
          );
        },

      ),
    );
  }
}