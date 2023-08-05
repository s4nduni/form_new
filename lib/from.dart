import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // create key for use the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: unused_field
  late String _name;
  Widget _builderNameField(){
    return TextFormField(
                  maxLength: 80,
                  maxLines: 2,
                  decoration: InputDecoration(hintText: 'Name'),
                  validator: (text){
                    if(text!.isEmpty){
                      return 'Name is Empty';
                    }
                    return null;
                  },
                  onSaved: (text){
                    _name = text!;
                  },

        );
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      // scroval krnn dl thiynne
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(24.00),
            child: Column(
              children:<Widget> [

                // wenm funtion ekkt dl 
                _builderNameField(),

                
                // TextFormField(
                //   maxLength: 80,
                //   maxLines: 2,
                //   decoration: InputDecoration(hintText: 'Name'),
                //   validator: (text){
                //     if(text!.isEmpty){
                //       return 'Name is Empty';
                //     }
                //     return null;
                //   },
                //   onSaved: (text){
                //     _name = text!;
                //   },

                // ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child:  ElevatedButton(
                    child: Text('save'),
                    onPressed:(){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState?.save();
                         print(_name);

                      }
                     
                    },

                  ),
                )
                
              ]),
              
          ),
        ),
      )
       
    );
  }
}
