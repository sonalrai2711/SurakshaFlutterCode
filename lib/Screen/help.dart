import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:surakshaproj/Screen/navDart.dart';
import 'package:intl/intl.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import '../Screen/messages.dart';

class HelpScreen extends StatefulWidget{
  const HelpScreen({Key? key}) : super (key: key);

  @override
  _HelpState createState() => _HelpState();
}
class _HelpState  extends State<HelpScreen> {

  final TextEditingController _controller =  TextEditingController();
  final List<Map<String,dynamic>> messages = [];
  late DialogFlowtter dialogFlowtter;

  @override
  void initState(){
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('How can we help you?'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () =>
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => NavBarScreen()))
            },
          )
      ),
      body: Container(
          child: Column(
              children: [
                Expanded(child: MessageScreen(messages: messages)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: _controller,
                            style: TextStyle(color: Colors.black26),
                          )),
                      IconButton(onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      }, icon: Icon(Icons.send)),
                    ],
                  ),
                )
              ]
          )
      ),
    );
  }
  /*Widget chat(String message, int data){
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: data == 1? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0 ? Container(
            height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sos.jpg'),
              )
      ): Container(),
          Padding(
              padding: EdgeInsets.all(10),
              child: Bubble(
                radius: Radius.circular(15),
                color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 200),
                            child: Text(
                              message,
                              style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                ),
              )
          ),
          data == 1 ? Container(
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/Sonal.jpg'),
              )
          ): Container(),

        ],
      ),
    );
  }*/
  sendMessage(String text) async{
    print("Text:" + text);
    if(text.isEmpty){
      print("Message is Empty");
    }
    else{
      setState(() {
        addMessage(Message(
          text: DialogText(text: [text])),true);
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text:text)));
      String? textResponse = response.text;

      if (response.message == null) return;
      setState(() {

        addMessage(response.message!);
        });
      }
      }
  addMessage(Message message, [bool isUserMessage = false]){
    messages.add({
      'message': message,
      'isUserMessage': isUserMessage
    });


  }

}