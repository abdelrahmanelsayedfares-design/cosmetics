import 'dart:async';

import 'package:flutter/material.dart';

class PlayWithStreamsView extends StatefulWidget {
  const PlayWithStreamsView({super.key});

  @override
  State<PlayWithStreamsView> createState() => _PlayWithStreamsViewState();
}

class _PlayWithStreamsViewState extends State<PlayWithStreamsView> {

  final controller = StreamController<String>();
  int count=0;

  // final stream = Stream.periodic(
  //   Duration(seconds: 1),
  //   (count) =>count,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PlayWithStreamsView')),

      body: StreamBuilder(
        initialData: count,
        stream: controller.stream,

        // دهمثلا علشان عد اللثواني بتاع مثلا OTP
        // builder: (context, event) {
        //
        //   int totalseconds = event.data!;
        //   int minutes = totalseconds~/60 ;
        //   int seconds = totalseconds%60;
        //
        //   return Center(
        //     child: Text(
        //       '${minutes.toString().padLeft(2,"0")}:${seconds.toString().padLeft(2,"0")}',
        //       style: TextStyle(fontSize: 50, color: Colors.black),
        //     ),
        //   );
        // },




        builder: (context, event)=>Center(
          child: Text(
            event.data!.toString(),
            style: TextStyle(fontSize: 50, color: Colors.black),
          ),
        ),



        // ده هنا خاصيه ان لو عايز اعرض الساعه حاليا مع السستم با لساعه والدقايق والثانيه
        // builder:  (context, event) {
        //   final now = DateTime.now();
        //  return Center(
        //     child: Text(
        //       "${now.hour}:${now.minute}:${now.second}",
        //       style: TextStyle(fontSize: 20, color: Colors.black),
        //     ),
        //   );
        // },

      ),

    );
  }
  @override
  void dispose(){
    controller.close();
    super.dispose();
  }
}
