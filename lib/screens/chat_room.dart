import 'package:flutter/material.dart';

List<Map<String, String>> CHATS = [
  {
    'chat':
        'Hi I am Joseph. I just helped a old woman to cross the road. Feeling happy',
    'by': 'Joseph'
  },
  {'chat': 'That\'s very kind you Joseph', 'by': 'me'},
  {'chat': 'Yeah Man, that was kidn', 'by': 'John'},
  {'chat': 'Kind*', 'by': 'John'},
  {'chat': 'I will share my experience at night', 'by': 'John'},
  {'chat': 'That would be late for me, I may not be able to join', 'by': 'me'},
];

class ChatRoom extends StatelessWidget {
  ChatRoom(@required this.group_name, @required this.color);
  final String group_name;
  final Color color;
  final _chatController = TextEditingController();
  Widget _Card(String title, Color clr1, Color clr2, double width, bool kind) {}

  List<Widget> chatItems = List.generate(CHATS.length, (i) {
    String chat = CHATS[i]['chat'];
    String by = CHATS[i]['by'];
    Color clr1, clr2;
    if (by == 'me') {
      clr1 = Colors.blue;
      clr2 = Colors.blue;
    } else {
      clr1 = Colors.pink;
      clr2 = Colors.pink;
    }
    return Align(
        alignment: by == 'me' ? Alignment.centerRight : Alignment.centerLeft,
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
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$chat',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$by',
                    style: TextStyle(color: Colors.white, fontSize: 8.0),
                  ),
                ),
              ],
            ),
          ),
        ));
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$group_name'),
        backgroundColor: color,
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
                            color: color,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: color,
                            width: 3,
                          ),
                        ),
                        hintStyle: TextStyle(fontSize: 16.0),
                        hintText: 'Enter you message here',
                        prefixIcon:
                            Icon(Icons.message, size: 18.0, color: color),
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
