import 'package:app_using_getx/homescreen.dart';
import 'package:app_using_getx/example/listGetxExample.dart/getListui.dart';
import 'package:app_using_getx/example/opacityChange/opacityexampleui.dart';
import 'package:app_using_getx/res/routes/routes.dart';
import 'package:app_using_getx/example/switchexample/switchExample.dart';
import 'package:app_using_getx/res/language/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Language(), // your translations
      locale:
          Locale('en', 'US'), // translations will be displayed in that locale
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      getPages: AppRoutes.appRoutes(),
      home: const Homescreen(),
    );
  }
}
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Facts',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         hintColor: Colors.green,
//       ),
//       home: FlutterFactsChatBot(key: null, title: '',),
//     );
//   }
// }
// import 'package:dialogflow_flutter/dialogflowFlutter.dart';
// import 'package:dialogflow_flutter/googleAuth.dart';
// import 'package:dialogflow_flutter/language.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Example Dialogflow Flutter',
//       theme: new ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: new MyHomePage(title: 'Flutter Demo Dialogflow'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<ChatMessage> _messages = <ChatMessage>[];
//   final TextEditingController _textController = new TextEditingController();

//   Widget _buildTextComposer() {
//     return new Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: new Row(
//         children: <Widget>[
//           new Flexible(
//             child: new TextField(
//               controller: _textController,
//               onSubmitted: _handleSubmitted,
//               decoration:
//                   new InputDecoration.collapsed(hintText: "Send a message"),
//             ),
//           ),
//           new Container(
//             margin: new EdgeInsets.symmetric(horizontal: 4.0),
//             child: new IconButton(
//                 icon: new Icon(Icons.send),
//                 onPressed: () => _handleSubmitted(_textController.text)),
//           ),
//         ],
//       ),
//     );
//   }

//   void Response(query) async {
//     _textController.clear();
//     print("object");
//     AuthGoogle authGoogle =
//         await AuthGoogle(fileJson: "assets/medbot.json").build();
//     DialogFlow dialogflow =
//         DialogFlow(authGoogle: authGoogle, language: Language.english);
//     print("chekc $dialogflow");
//     AIResponse response = await dialogflow.detectIntent(query);
//     print("check $response");
//     ChatMessage message = new ChatMessage(
//       text: response.getMessage().toString(),
//       name: "Bot",
//       type: false,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     ChatMessage message = new ChatMessage(
//       text: text,
//       name: "Rances",
//       type: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     Response(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new Column(children: <Widget>[
//         new Flexible(
//             child: new ListView.builder(
//           padding: new EdgeInsets.all(8.0),
//           reverse: true,
//           itemBuilder: (_, int index) => _messages[index],
//           itemCount: _messages.length,
//         )),
//         new Divider(height: 1.0),
//         new Container(
//           decoration: new BoxDecoration(color: Theme.of(context).cardColor),
//           child: _buildTextComposer(),
//         ),
//       ]),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   ChatMessage({required this.text, required this.name, required this.type});

//   final String text;
//   final String name;
//   final bool type;

//   List<Widget> otherMessage(context) {
//     return <Widget>[
//       new Container(
//         margin: const EdgeInsets.only(right: 16.0),
//         child: new CircleAvatar(child: new Image.asset("img/placeholder.png")),
//       ),
//       new Expanded(
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             new Text(this.name,
//                 style: new TextStyle(fontWeight: FontWeight.bold)),
//             new Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: new Text(text),
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   List<Widget> myMessage(context) {
//     return <Widget>[
//       new Expanded(
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             new Text(this.name),
//             new Container(
//               margin: const EdgeInsets.only(top: 5.0),
//               child: new Text(text),
//             ),
//           ],
//         ),
//       ),
//       new Container(
//         margin: const EdgeInsets.only(left: 16.0),
//         child: new CircleAvatar(child: new Text(this.name[0])),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: new Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: this.type ? myMessage(context) : otherMessage(context),
//       ),
//     );
//   }
// }
