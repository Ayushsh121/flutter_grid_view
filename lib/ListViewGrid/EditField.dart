import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditField extends StatefulWidget {
  final String name;
  final String city;
  const EditField({Key? key, required this.name, required this.city,}) : super(key: key);

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final Key key = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.name;
    nameController.text = widget.name;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(title: Text(""),centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Form(
        key: key,
          child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Enter the name"
            ),
          ),
          TextField(
            controller: cityController,
            decoration: InputDecoration(
              hintText: "Enter the city"
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Update")
          )
        ],
      )),
    );
  }
}
