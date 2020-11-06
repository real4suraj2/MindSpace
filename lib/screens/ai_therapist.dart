import 'package:flutter/material.dart';

List<Map<String, String>> CHATS = [
  {'chat': 'Hi Feroz! how may I help you', 'by': 'bot'},
  {'chat': 'Am I improving, unable to understand the reports', 'by': 'user'},
  {
    'chat':
        'Feroz, As per you statistics, you are doing great. Keep maintaining this schedule',
    'by': 'bot'
  },
  {'chat': 'Do you need any further assistance ?', 'by': 'bot'},
  {'chat': 'No thanks!', 'by': 'user'},
];

class AiTherapist extends StatelessWidget {
  final _chatController = TextEditingController();
  Widget _Card(String title, Color clr1, Color clr2, double width, bool kind) {}

  List<Widget> chatItems = List.generate(CHATS.length, (i) {
    String chat = CHATS[i]['chat'];
    String by = CHATS[i]['by'];
    Color clr1, clr2;
    if (by == 'bot') {
      clr1 = Colors.pink;
      clr2 = Colors.pink;
    } else {
      clr1 = Colors.blue;
      clr2 = Colors.blue;
    }
    return Align(
        alignment: by == 'bot' ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          width: 180.0,
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.3, 1],
              colors: [clr1, clr2],
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '$chat',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ));
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ai Therapist'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 12.0),
                  height: MediaQuery.of(context).size.height - 120.0,
                  child: ListView.builder(
                      itemCount: CHATS.length,
                      itemBuilder: (BuildContext context, int index) =>
                          chatItems[index]),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 6.0),
                    child: TextField(
                      controller: _chatController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.pink,
                            width: 3,
                          ),
                        ),
                        hintStyle: TextStyle(fontSize: 16.0),
                        hintText: 'Enter your query here',
                        prefixIcon:
                            Icon(Icons.message, size: 18.0, color: Colors.pink),
                        contentPadding: EdgeInsets.all(14.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
