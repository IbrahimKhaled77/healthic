
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'states_Manage_picture_patien_screen.dart';

class CubitManage_picturePatien extends Cubit<statesMangePicturePatient>{
  CubitManage_picturePatien() : super(initialMangePicturePatient());

 static CubitManage_picturePatien get(context)=>BlocProvider.of(context);


  File? ImageBefor;
  var pickerBefor=ImagePicker();
  Future<PickedFile?> getImageBeforpatine()async{
    final pickedFile= await pickerBefor.getImage(source:ImageSource.gallery, );

    if(pickedFile!=null){
      ImageBefor=File(pickedFile.path);
      emit(PictureBeforedietplanSucsse());
    }else{
      print("NO image selected.");
      emit(PictureBeforedietplanError());
    }


  }

  File? ImageAfter;
  var pickerAfter=ImagePicker();
  Future<PickedFile?> getImageAfterpatine()async{
    final pickedFile= await pickerAfter.getImage(source:ImageSource.gallery, );

    if(pickedFile!=null){
      ImageAfter=File(pickedFile.path);
      emit(PictureAfterdietplanSucsse());
    }else{
      print("NO image selected.");
      emit(PictureAfterietplanError());
    }


  }




}