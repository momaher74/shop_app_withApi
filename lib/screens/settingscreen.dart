import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app2/cubit/cubit.dart';
import 'package:shop_app2/cubit/states.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var suffex = ShopCubit.get(context).suffix ;
    var model = ShopCubit.get(context).userModel ;
    var emailController = TextEditingController() ;
    var passwordController = TextEditingController() ;
    var nameController = TextEditingController() ;
    var phoneController = TextEditingController() ;
    emailController.text =  model.data.email ;
    nameController.text =  model.data.name ;
    phoneController.text =  model.data.phone ;

    var formKey = GlobalKey<FormState>() ;

    return BlocConsumer<ShopCubit , ShopAppStates>(
      listener: (context , state){

      },
      builder: (context , state)=>Scaffold(
        appBar: AppBar(),
        body: ConditionalBuilder(
          condition: model!=null ,
          builder: (context ){return Form(
            key: formKey,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepPurple[800],
                      Colors.deepPurple[700],
                      Colors.deepPurple[600],
                      Colors.deepPurple[400],
                    ],
                  )
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Profile" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24 , letterSpacing: 1.5  ,color: Colors.white ),) ,
                      SizedBox(height: 20,),
                      TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return " Not Valid  " ;
                          }else { return null ;}
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.person) ,
                            labelText: "enter your name " ,
                            //suffixIcon: Icon(Icons.email_outlined) ,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        controller:nameController ,
                        keyboardType: TextInputType.text,

                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return " Not Valid  " ;
                          }else { return null ;}
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone_android) ,
                            labelText: "enter your phone number " ,
                            suffixIcon: Icon(Icons.phone) ,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        controller:phoneController ,
                        keyboardType: TextInputType.text,

                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return " Not Valid  " ;
                          }else { return null ;}
                        },
                        decoration: InputDecoration(
                            icon: Icon(Icons.email) ,
                            labelText: "enter your Email" ,
                            suffixIcon: Icon(Icons.email_outlined) ,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        controller:emailController ,
                        keyboardType: TextInputType.text,

                      ),
                      SizedBox(height: 20,),
                      if(state is ShopAppUpdateProfileDataLoadingState)
                        Center(child: CircularProgressIndicator()),
                      if(state is! ShopAppUpdateProfileDataLoadingState)
                      Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(10),
                                backgroundColor: MaterialStateProperty.all(Colors.deepPurple)
                              ),
                              onPressed: (){
                            if(formKey.currentState.validate()){
                              ShopCubit.get(context).updateProfile(name: nameController.text, phone: phoneController.text, email: emailController.text);                                  }
                          },
                              child: Text("Update"))) ,
                      SizedBox(height: 20,),
                      Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10),
                                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple)
                              ),
                              onPressed: (){
                                  if(formKey.currentState.validate()){
                                    ShopCubit.get(context).signOut(context) ;                                  }
                          }, child: Text("Sign out"))) ,
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          ) ;},
          fallback:(context)=>CircularProgressIndicator() ,
        ),
      ),
    );
  }
}
