import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:surakshaproj/navDart.dart';
import 'package:intl/intl.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';

class HelpScreen extends StatefulWidget{
  const HelpScreen({Key? key}) : super (key: key);

  @override
  State<HelpScreen> createState() => _HelpScreen();
}
class _HelpScreen extends State<HelpScreen> {

  final TextEditingController _controller =  TextEditingController();
  final List<Map<String,dynamic>> messages = [];
  late DialogFlowtter dialogFlowtter;

  @override
  void initState(){
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  void response(query) async{
    print("Query: " + query);
    AuthGoogle authGoogle = await AuthGoogle(
      fileJson: 'assets/dialog_flow_auth.json'
    ).build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle,
        language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messages.insert(0, {
        "data" : 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
      //print(messages);
    });

    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text('How can we help you?'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed:() =>
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder:
                      (context) => NavBar()))
            },
          )
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 15,bottom: 10),
                child: Text("Today, ${DateFormat("Hm").format(DateTime.now())}",
                  style: TextStyle(fontSize: 20),),
              ),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) => chat(
                      messages[index]["message"].toString(),
                      messages[index]["data"]
                    )),
            ),
          Divider(
            height: 5,
            color: Colors.green,
          ),
            Container(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.green,size: 35,), onPressed: () {  },
                ),
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(220, 220, 220, 1)
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Enter a message",
                      hintStyle: TextStyle(
                        color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    //onChanged: (value),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.send,
                  size: 30,
                  color: Colors.green,),
                  onPressed: () {
                    if(messageController.text.isEmpty){
                      print("Empty Message");
                    }
                    else{
                      setState(() {
                        messages.insert(0,
                            {"data": 1, "message": messageController.text});
                      });
                      response(messageController.text);
                      //print("message"+ messageController.text + " " );
                      messageController.clear();
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if(!currentFocus.hasPrimaryFocus){
                      currentFocus.unfocus();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget chat(String message, int data){
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
  }
  sendMessage(String text) async{
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