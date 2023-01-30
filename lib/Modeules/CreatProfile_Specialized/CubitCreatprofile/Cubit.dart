

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hea_apps/Modeules/CreatProfile_Specialized/CubitCreatprofile/states.dart';
import 'package:image_picker/image_picker.dart';

class CreatProfileSpecializedcubit extends Cubit<CreatprofileSpecializedstate>{
  CreatProfileSpecializedcubit() : super(initialCreatprofileSpecializedState());

  static CreatProfileSpecializedcubit get(context)=>BlocProvider.of(context);

  String?c;
  File? ImageProfil;
  var picker=ImagePicker();
  Future<PickedFile?> getImageProfile()async{
    final pickedFile= await picker.getImage(source:ImageSource.gallery, );

    if(pickedFile!=null){
      ImageProfil=File(pickedFile.path);
      emit(profileImageSpecializedSucessState());
    }else{
      print("NO image selected.");
      emit(profileImageSpecializedErrorState());
    }


  }

  File SaveImage(){

    emit(profileImageSVAG_AdimState());
    return  ImageProfil!;

  }
  File? ImageProfilCV;
  var pickerCv=ImagePicker();
  Future<PickedFile?> getImageProfileCV()async{
    final pickedFile= await picker.getImage(source:ImageSource.gallery, );

    if(pickedFile!=null){
      ImageProfil=File(pickedFile.path);
      emit(ImageProfilCVImageSpecializedSucessState());
    }else{
      print("NO imageCV selected.");
      emit(ImageProfilCVSpecializedErrorState());
    }


  }



  void ChangeRaiosCreatprofile({required value}){
    emit(ChangeRaiosCreatprofileState());
    c=value;


  }









}