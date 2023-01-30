/*  TextFormField(

                              //   cursorColor: Colors.black26,
                              controller: namecontroller,
                              onFieldSubmitted: (value){
                                print(namecontroller.text);
                              },
                              /*  onChanged: (value){
                              print(namecontroller.text);
                            },*/
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return "You must enter your name " ;
                                }

                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                ),
                                //prefixIcon:Icon(Icons.person,color: defultColor.withOpacity(0.6)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),

                              ),
                            ),*/


//Color(0xffD5D9E0FF),


/* TextFormField(

                              //cursorColor: Colors.black26,
                              controller: Emailcontroller,
                              onFieldSubmitted: (value){
                                print(Emailcontroller.text);
                              },
                              /*  onChanged: (value){
                              print(Emailcontroller.text);
                            },*/
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return "You must enter your email " ;
                                }

                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                labelStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                ),
                               // prefixIcon:Icon(Icons.email_rounded,color:defultColor.withOpacity(0.6),),
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20.0) ,
                                  borderSide: BorderSide(

                                    color: Colors.red,
                                  ),
                                ),

                              ),
                            ),*/
/* TextFormField(
                              obscureText: cubit.IsShowEye,
                              //cursorColor: Colors.black26,
                              controller: Passwordcontroller,
                              onFieldSubmitted: (value){
                                print(Passwordcontroller.text);
                              },
                              /*  onChanged: (value){
                              print(Emailcontroller.text);
                            },*/
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return "You must enter your Password " ;
                                }

                              },
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                ),
                             //  prefixIcon:Icon(Icons.lock,color:defultColor.withOpacity(0.6)),
                                suffixIcon:IconButton(icon:Icon(cubit.Icon,color: defultColor,),onPressed:(){
                                  cubit.RegisterSpeShowVisiblePassword();
                                  ;},),
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20.0) ,
                                  borderSide: BorderSide(

                                    // color: Colors.red,
                                  ),
                                ),

                              ),
                            ),*/
/* TextFormField(

                              //cursorColor: Colors.black26,
                              controller:phonecontroller,
                              onFieldSubmitted: (value){
                                print(phonecontroller.text);
                              },
                              /*  onChanged: (value){
                              print(Emailcontroller.text);
                            },*/
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return "You must enter your phone " ;
                                }

                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: "Phone",
                                labelStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                ),
                              // prefixIcon:Icon(Icons.phone_android,color:defultColor.withOpacity(0.6),),
                                border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20.0) ,
                                  borderSide: BorderSide(

                                    // color: Colors.red,
                                  ),
                                ),

                              ),
                            ),*/