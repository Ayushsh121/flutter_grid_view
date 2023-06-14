import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'ModelClass.dart';

class getProvider with ChangeNotifier{
  bool isList = true;
  List<ModelData> list = [];
  Future<dynamic> apiCall() async{
    var url = "https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    if(res.statusCode==200){
      for(Map<String , dynamic> i in data){
        list.add(ModelData.fromJson(i));
      }
      return list;
    }
}
void refreshProvider(){
    isList = false;
   notifyListeners();
}
void getRefresh(){
    isList = true;
    notifyListeners();
}
}