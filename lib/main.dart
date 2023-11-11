import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Basic Flutter Widgets Demo',
      home:MyHomePage(),
    );

  }
}
class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState()=>_MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  String name='';
  List<String> items=['Item 1','Item 2','Item 3','Item 4','Item 5'];
  TextEditingController _nameController=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('Basic Flutter Widgets Demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
          onChanged: (value){
            setState((){
              name=value;
            });
          },
    ),
            ElevatedButton(
    onPressed: (){
    //   showDialog(
    //     context: context,
    //     builder: (context){
    //       return AlertDialog(
    //         title: Text('Alert'),
    //         content: Text('Hello $name'),
    //         actions: [
    //           TextButton(
    //             onPressed: (){
    //               Navigator.pop(context);
    //             },
    //             child: Text('Ok'),
    //           ),
    //         ],
    //       );
    //     },
    //   );

              setState(() {
              items.add('Item ${items.length+1}');
              });
               },
              child: Text('Add Item'),
              ),
              Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Welcome, $name !',
                          style: TextStyle(fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
              ),
                    SizedBox(height: 10.0,),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: Text(items[index]),
                        );
                      },
                    ),
                  ],
                ),
              )
              ),
          ],
        ),
      ),
    );
  }
}