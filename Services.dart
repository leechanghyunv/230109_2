import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SubwayData.dart';

class Services {

  String subwayName1 = '서울';
  Services({
    required this.subwayName1,
  });


   Future<List<RealtimeArrivalList>> GetInfo() async{
     String Url = ' http://swopenapi.seoul.go.kr/api/subway/4c6f72784b6272613735677166456d/json/realtimeStationArrival/0/5/서울';
               /// http://swopenapi.seoul.go.kr/api/subway/4c6f72784b6272613735677166456d/json/realtimeStationArrival/0/5/서울
     try{
      final response = await http.get(Uri.parse(Url));
      if(response.statusCode == 200){
        print('Got a Data');
        final List<RealtimeArrivalList> RowApi = subwayApiFromJson(response.body) as List<RealtimeArrivalList>;
        return RowApi;

      }else{
        print('Error occured');
        return <RealtimeArrivalList>[];
      }
    }catch(e){
      print('Error occured again ${subwayName1}');
      return <RealtimeArrivalList>[];
    }
  }


}
