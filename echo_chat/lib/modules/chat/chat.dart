import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_chat/models/message_model.dart';
import 'package:echo_chat/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';

  var messageController = TextEditingController();
  final listViewController = ScrollController();

  CollectionReference messages =
  FirebaseFirestore.instance.collection(kMessagesCollection);

  @override
  Widget build(BuildContext context) {
    String emailAddress = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages
          .orderBy(
        kCreatedAt,
        descending: true,
      )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];

          for (int count = 0; count < snapshot.data!.docs.length; count++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[count]));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Image.asset(
                    kLogoPath,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Echo Chat',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      reverse: true,
                      controller: listViewController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].emailAddress == emailAddress
                            ? SenderChatBubble(message: messagesList[index])
                            :RecieverChatBubble(message: messagesList[index])
                        ;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          )),
                      suffixIcon: Container(
                        width: 116,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.link_outlined,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: kPrimaryColor,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.send_outlined,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                if (messageController.text.isNotEmpty) {
                                  messages.add({
                                    kMessage: messageController.text,
                                    kCreatedAt: DateTime.now(),
                                    kEmailAddress: emailAddress,
                                  });
                                  messageController.clear();
                                  listViewController.animateTo(
                                    0,
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Message',
                    ),
                    onSubmitted: (messageValue) {},
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Image.asset(
                    kLogoPath,
                    height: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Echo Chat',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
            ),
            body: Center(child: Text('Loading...')),
          );
        }
      },
    );
  }
}
