// ignore_for_file: sized_box_for_whitespace

import 'package:collected_projects/modules/news_app/webview/webview_screen.dart';
import 'package:collected_projects/shared/cubit/todo_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';


//import 'package:news_app/modules/webview/webview_screen.dart';


Widget defaultLoginButton({
  double width = double.infinity,
  required Color backgroundColor,
  required final void Function()? function,
  required String text,
}) =>
    Container(
      color: backgroundColor,
      width: double.infinity,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required final String? Function(String?)? validate,
  final void Function(String)? onChange,
  final void Function(String)? onSubmit,
  Function? onTap,
  bool obsecuredText = false,
  IconData? suffix,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap != null ? () => onTap() : null,
      validator: validate,
      obscureText: obsecuredText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ))
            : null,
      ),
    );

////////////////////////////////////// To do App Sqflite



Widget buildTasksItem(Map data,context)
{
  return Dismissible(
    key: Key(data['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [

          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.teal[200],
            foregroundColor: Colors.blueGrey[900],
            child: Text(
                '${data['time']}'
            ),

          ),

          SizedBox(width: 10,),


          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${data['title']}',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10,),

          IconButton(
            onPressed: (){
              AppCubit.get(context).updateDatabase(
                status: 'Done',
                id: data['id'],
              );
            },
            icon: Icon(
              Icons.check_box_outlined,
              color: Colors.green,
            ),
          ),

          SizedBox(width: 10,),

          IconButton(
            onPressed: (){
              AppCubit.get(context).updateDatabase(
                status: 'Archived',
                id: data['id'],
              );
            },
            icon: Icon(
              Icons.archive_outlined,
              color: Colors.black45,
            ),
          ),

        ],
      ),
    ),
    onDismissed: (direction){

      AppCubit.get(context).deleteDatabase(id: data['id']);
    },
  );
}


Widget tasksBuilder({required List<Map>tasks})
{
  return ConditionalBuilder(
    condition: tasks.length>0,
    builder: (context)=>ListView.separated(
      itemBuilder: (context, index){
        //print('Task status ${tasks[index]['status']}');
        return buildTasksItem(tasks[index],context);
      },
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
        ),
        child: Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
      ),
      itemCount: tasks.length,
    ),
    fallback: (context)=>Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.blueGrey,
            size: 100,
          ),
          Text(
            'no tasks added yet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}



Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child:   Padding(

    padding: const EdgeInsets.all(20),

    child: Row(

        children:[

          Container(

            width: 120,

            height: 120,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),

                image: DecorationImage(

                  image: NetworkImage('${article['urlToImage']}'),

                  fit: BoxFit.cover,

                )

            ),

          ),

          const SizedBox(width: 20,),



          Expanded(

            child: Container(

              height: 120,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      '${article['title']}',

                      style: Theme.of(context).textTheme.bodySmall,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: const TextStyle(

                      color: Colors.grey,

                    ),

                  )

                ],

              ),

            ),

          )

        ]

    ),

  ),
);


Widget mySeparator()=>Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
    end: 20,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);


Widget articleBuilder(list,context,{isSearch=false})=>ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=> ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context,index)=>buildArticleItem(list[index],context),
    separatorBuilder: (context,index) =>mySeparator(),
    itemCount: list.length,
  ) ,
  fallback: (context)=> isSearch? Container() : Center(
    child: CircularProgressIndicator(),
  ),
);




void navigateTo(context,widget)
{
  Navigator.push(
   context ,
   MaterialPageRoute(builder: (context)
   {return widget;}
   ),
  );

}// Navigator method



