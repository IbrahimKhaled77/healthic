

import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hea_apps/Modeules/CreatProfile_patien/CubitCreatprofile/statesa.dart';
import 'package:image_picker/image_picker.dart';

class CreatProfilepatiencubit extends Cubit<CreatprofilepatienState>{
  CreatProfilepatiencubit() : super(initialCreatprofilepatienState());

  static CreatProfilepatiencubit get(context)=>BlocProvider.of(context);


  File? ImageProfil;
  var picker=ImagePicker();
  Future<PickedFile?> getImageProfilepatine()async{
    final pickedFile= await picker.getImage(source:ImageSource.gallery, );

    if(pickedFile!=null){
      ImageProfil=File(pickedFile.path);
      emit(profileImagepatienSucessState());
    }else{
      print("NO image selected.");
      emit(profileImagepatienErrorState());
    }


  }
  String? c ;
  void ChangeRaiosCreatprofilepatien({required value}){
    emit(ChangeRaiosCreatprofilepatieState());
    c=value;


  }





}