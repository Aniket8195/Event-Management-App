import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventapp/API/event_registration.dart';
import 'package:eventapp/Home/feed.dart';
import 'package:eventapp/check_registration.dart';
import 'package:flutter/material.dart';
import 'package:eventapp/API/get_event.dart';
import 'package:flutter/rendering.dart';
import 'Widgets/full_screen.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.event});
  final Event event;
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _isVisible = true;
  ScrollController controller = ScrollController();
  CheckRegistration checkRegistration = CheckRegistration();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isVisible = true; // Show FAB when scrolling up
        });
      } else if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isVisible = false; // Hide FAB when scrolling down
        });
      }
    });
  }
  void handleRegistrationSuccess() {

     userModel.fetchUserByEmail(mail!).then((_){
       setState(() {});
     }); // Replace with your actual fetch logic

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,color: Colors.deepOrange,)),
        title: const Text("Event Details",style: TextStyle(color: Colors.deepOrange),),
      ),
      body: SingleChildScrollView(
        child: Column(
               children: [
                 GestureDetector(
                   onLongPress: (){
                     if (widget.event.imageUrl != null && widget.event.imageUrl != " ") {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => FullScreenPage(
                               image: widget.event.imageUrl!, dark: false),
                         ),
                       );
                     }
                   },
                   child: Card(
                     child: ClipRRect(
                       child: CachedNetworkImage(
                         imageUrl: widget.event.imageUrl,
                         fit: BoxFit.cover,
                         width: double.infinity,
                         progressIndicatorBuilder: (context, url, downloadProgress) =>
                             Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                         errorWidget: (context, url, error) {
                           return const Icon(Icons.error);
                         },
                       ),
                     ),
                   ),
                 ),
                 Card(
                      child: Column(
                        children: [
                            Text(widget.event.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month_sharp,color: Colors.blueGrey,),
                                Text(widget.event.eventDate,style: const TextStyle(color: Colors.blueGrey),)
                              ],
                            ),
                          Row(
                            children: [
                              const Icon(Icons.access_time_filled_sharp,color: Colors.blueGrey,),
                              Text(widget.event.eventTime,style: const TextStyle(color: Colors.blueGrey),)
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_pin,color: Colors.blueGrey,),
                              Text(widget.event.location,style: const TextStyle(color: Colors.blueGrey),)
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text("ABOUT",style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text(widget.event.description,style: const TextStyle(color: Colors.blueGrey),textAlign: TextAlign.justify,)
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),


                        ],
                      ),
                 ),
                 AnimatedSwitcher(
                   duration: const Duration(milliseconds: 200),
                   transitionBuilder: (Widget child, Animation<double> animation) {
                     return SizeTransition(
                       sizeFactor: animation,
                       child: child,
                     );
                   },
                   child: _isVisible ?
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: Container(
                       margin: const EdgeInsets.only(bottom: 16.0),
                       child: SizedBox(
                         width: 150.0,
                         height: 50.0,
                         child: FloatingActionButton(
                           onPressed: () {
                             // Add your FAB action here
                           },
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(8.0),
                           ),
                           backgroundColor: Colors.blueGrey,
                           child: checkRegistration.checkR(widget.event.eventId,userModel.user!.registeredEvents) ? const Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Registered"),
                                 Icon(Icons.done,color: Colors.green,)
                               ],
                               )
                           :GestureDetector(
                           onTap: (){
                             EventReg.register(context,widget.event.eventId,userModel.user!.userId ,handleRegistrationSuccess,);
                            },
                            child:  const Text("Register"),
                         ),
                         ),
                       ),
                     ),
                   )
                       :const SizedBox(),

                 ),

               ],
        ),
      ),
    );
  }
}
