import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hea_apps/Layout/Cuibt_Layout_health_pation/states_pation.dart';
import 'package:image_picker/image_picker.dart';
class LayoutHealthPationCubit extends Cubit<LayoutHealthPationState>{
  LayoutHealthPationCubit() : super(initialLayoutHealthPationState());

  static LayoutHealthPationCubit get(context)=>BlocProvider.of(context);


  File? ImageProfil;
  var picker=ImagePicker();
  Future<PickedFile?> getImageProfile()async{
    final pickedFile= await picker.getImage(source:ImageSource.gallery, );

    if(pickedFile!=null){
      ImageProfil=File(pickedFile.path);
      emit(PostImagepatienSucessState());
    }else{
      print("NO image selected.");
      emit(PostImagepatienErrorState());
    }


  }



}