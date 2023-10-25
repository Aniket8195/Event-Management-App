import 'package:eventapp/API/get_event.dart';

class CheckRegistration{
  bool checkR(int eID,List<Event> registeredEvents){
    for(int i=0;i<registeredEvents.length;i++){
       if(registeredEvents[i].eventId==eID){
         return true;
       }
    }
    return false;
  }
}