// import 'package:flutter/material.dart';
////// using stateless widget:
// void main() => runApp(const MaterialApp(
//   home: NinjaCard(),
// ));
//
// class NinjaCard extends StatelessWidget {
//   const NinjaCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      backgroundColor: Colors.grey[900],
//      appBar: AppBar(
//        title: const Text('Ninja ID Card'),
//        foregroundColor: Colors.white,
//        centerTitle: true,
//        backgroundColor: Colors.grey[850],
//        elevation: 0.0,
//      ),
//     body: const Padding(
//       padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//           Center(
//             child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/Image_1.png'),
//                 radius: 50.0,
//                 ),
//           ),
//           Divider(
//             height: 60.0,
//             color: Colors.grey,
//           ),
//           Text(
//              'NAME',
//              style: TextStyle(
//                color: Colors.grey,
//                letterSpacing: 2.0,
//              )
//            ),
//           SizedBox(height: 10.0),
//           Text(
//               'Abdulla Nasir Chowdhury',
//               style: TextStyle(
//                 color: Colors.amberAccent,
//                 letterSpacing: 2.0,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               )
//           ),
//           Text(
//               'CURRENT NINJA LEVEL',
//               style: TextStyle(
//                 color: Colors.grey,
//                 letterSpacing: 2.0,
//               )
//           ),
//           SizedBox(height: 10.0),
//           Text(
//               '8',
//               style: TextStyle(
//                 color: Colors.amberAccent,
//                 letterSpacing: 2.0,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               )
//           ),
//           SizedBox(height: 30.0),
//             Row(
//               children: <Widget>[
//                 Icon(Icons.email, color: Colors.grey,),
//                 SizedBox(width: 10.0),
//                 Text('abdullahnasirchowdhury1@gmail.com',
//                     style: TextStyle(
//                       color: Colors.lightBlueAccent,
//                       letterSpacing: 1.0,
//                       fontWeight: FontWeight.normal,
//                     )),
//
//               ]
//             )
//         ],
//       )
//     ),
//     );
//   }
//
// }
//
//
/////// using stateful widget

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  const NinjaCard({super.key});

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjalevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[900],
     appBar: AppBar(
       title: const Text('Ninja ID Card'),
       foregroundColor: Colors.white,
       centerTitle: true,
       backgroundColor: Colors.grey[850],
       elevation: 0.0,
     ),

    floatingActionButton: Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 16,
            right: 0,
            child: FloatingActionButton(
              onPressed: (){
                setState((){
                  ninjalevel += 1;
                });
              },
              backgroundColor: Colors.grey,
              child: const Icon(Icons.add),
            )
           ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                setState((){
                  ninjalevel -= 1;
                });
              },
              backgroundColor: Colors.grey,
              child: const Icon(Icons.remove),
            )
          )
        ]
      ),
    ),

    body: Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          const Center(
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/Image_1.png'),
                radius: 50.0,
                ),
          ),
          const Divider(
            height: 60.0,
            color: Colors.grey,
          ),
          const Text(
             'NAME',
             style: TextStyle(
               color: Colors.grey,
               letterSpacing: 2.0,
             )
           ),
          const SizedBox(height: 10.0),
          const Text(
              'Abdulla Nasir Chowdhury',
              style: TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )
          ),
          const Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              )
          ),
          const SizedBox(height: 10.0),
          Text(
              '$ninjalevel',
              style: const TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              )
          ),
          const SizedBox(height: 30.0),
        Center(
          child: launchButton(
              text: 'Call Ninja', icon: Icons.call,
              onPressed: () async {
                Uri uri = Uri.parse('tel:+8801710990244');
                if (!await launchUrl(uri)){
                  debugPrint('Could not contact ninja');
                }
              }),
        ),
         Center(
           child: launchButton(
             text: 'Email Ninja', icon: Icons.email,
             onPressed: () async {
               Uri uri = Uri.parse('mailto:abdullahnasirchowdhury1@gmail.com?subject=Emailing Ninja&body=Hello Ninja!');
               if (!await launchUrl(uri)){
                 debugPrint('Could not email ninja');
               }
             }
           ),
         )
        ],
      )
    ),
    );
  }
  Widget launchButton({
      required String text,
      required IconData icon,
      required Function() onPressed,}
      ){
    return Container(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: Text(text, style: TextStyle()),
        icon: Icon(icon),
      )
    );
  }
}