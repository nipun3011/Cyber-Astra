// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  bool _botFlag = false;

  Future<void> response(query) async {
    AuthGoogle authGoogle = await AuthGoogle(
      fileJson: "./assets/cybercrime-chatbot-b451011d231c.json",
    ).build();
    DialogFlow dialogflow = DialogFlow(authGoogle: authGoogle);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messages.insert(0, {
        "data": 0,
        "message":
            aiResponse.getListMessage()?[0]["text"]["text"][0].toString(),
      });
    });
  }

  Future<void> handleResponse(String query) async {
    try {
      await response(query);
    } catch (error) {
      print("Error occurred: $error");
    } finally {
      setState(() {
        isLoading = false; // Set loading indicator to false
      });
    }
  }

  final messageInsert = TextEditingController();
  List<Map<dynamic, dynamic>> messages = [];
  bool isLoading = false; // Added loading indicator state
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 2),
        color: Colors.white,
      ),
      width: 300,
      height: 600,
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (context, index) => messages[index]["data"] == 0
                  ? Text(messages[index]["message"].toString(),
                      style: TextStyle(fontSize: 15))
                  : Text(
                      messages[index]["message"].toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
            ),
          ),
          Divider(
            height: 5.0,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: messageInsert,
                    decoration: InputDecoration.collapsed(
                      hintText: "Send your message",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30.0,
                      color: const Color.fromARGB(255, 24, 106, 174),
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                        return;
                      }
                      setState(() {
                        messages.insert(
                            0, {"data": 1, "message": messageInsert.text});
                        isLoading = true; // Set loading indicator to true
                      });

                      handleResponse(messageInsert.text);

                      messageInsert.clear();
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          if (isLoading) Text("Loading..."), // Text loading indicator
        ],
      ),
    );
  }
}
