import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'EditField.dart';
import 'ModelClass.dart';
import 'Provider_Class.dart';

class ListViews extends StatefulWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  State<ListViews> createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<getProvider>(context,listen: false).apiCall();
  }
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<getProvider>();
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(""),centerTitle: true,
        actions: [
          provider.isList?Center(
            child: TextButton(
              child: Text("Tap to GridView",style: TextStyle(fontSize: 25,color: Colors.pink),),
                onPressed: () {
                  provider.refreshProvider();
                }),
          ):TextButton(
              onPressed: (){
                provider.getRefresh();
          }, child: Text("Back to ListView",style: TextStyle(fontSize: 25,color: Colors.pink)))
        ],
      ),
      body:
      provider.isList?FutureBuilder(
          future: provider.apiCall(),
      builder: (BuildContext context,
          AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context , index){
              return
                ListTile(
                  title: Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("${provider.list[index].city.toString()}",style: TextStyle(
                          fontSize: 18
                      ))),
                  trailing: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>EditField(
                        name: provider.list.elementAt(index).name.toString(),
                        city: provider.list.elementAt(index).city.toString(),
                      )));
                    },
                    child: Icon(Icons.edit),
                  ),
                  leading: Container(
                      child: Text(provider.list[index].name.toString(),style: TextStyle(
                          fontSize: 25
                      ))),
                );
            });
      },):GridView.builder(
        itemCount:provider.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: (2 / 1), crossAxisCount: 2,
        ),
        itemBuilder: (context,index,) {
          return Container(
              color: Colors.lightGreenAccent,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Text(provider.list[index].city.toString()),
                  Text(provider.list[index].name.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center),
                ],
              ));
        },
      ),
    );
  }
}
