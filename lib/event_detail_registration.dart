import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/API/get_event.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.event});
  final Event event;
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.deepOrange,)),
        title: Text("Event Details",style: TextStyle(color: Colors.deepOrange),),
      ),
      body: Column(

      ),
    );
  }
}
