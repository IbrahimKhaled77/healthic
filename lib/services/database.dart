import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/chat/message_model.dart';
import '../models/usermodel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference nutritionCollection =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference appointmentCollection =
      FirebaseFirestore.instance.collection('appointment');
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('chat');
  final CollectionReference planCollection =
  FirebaseFirestore.instance.collection('plan');
  final CollectionReference postCollection =
  FirebaseFirestore.instance.collection('post');

  Future<void> addUserData(
      String email,
      String name,
      String type,
      String age,
      String address,
      String phone,
      String gender,
      String clinic,
      String location,
      String myImage,
      String myCv,
      String weight,
      String height,
      String diseases,
      String caneSearch,
      String myCover,
      String latlang,
      ) async {
    return await nutritionCollection.doc(uid).set({
      'name': name,
      'email': email,
      'uid': uid,
      'type': type,
      'age': age,
      'address': address,
      'phone': phone,
      'gender': gender,
      'clinic': clinic,
      'location': location,
      'myImage': myImage,
      'myCv': myCv,
      'weight': weight,
      'height': height,
      'diseases': diseases,
      'caneSearch':caneSearch,
      'myCover':myCover,
      'latlang':latlang

    });
  }
  Future<void> updateUserInfo(String name,  String age,String phone) async {

    return await nutritionCollection.doc(uid).update({'name': name,'age': age,'phone': phone});
  }
  Future<void> updatePatintInfo(String name,  String age,String phone,String widght,String height,String diseases) async {

    return await nutritionCollection.doc(uid).update({'name': name,'age': age,'phone': phone,'weight':widght,'height':height,'diseases':diseases});
  }
  Future<void> addAppointment(
      String uidpatint,
      String uidspitizet,
      String time,
      String day,
      String typeappointment,
      String status,
      String namepaint,
      String namespitizet,
      String imagepatint,
      String imagespitizet) async {
    String docId = appointmentCollection.doc().id;
    return await appointmentCollection.doc(docId).set({
      'key': docId,
      'uidpatint': uidpatint,
      'uidspitizet': uidspitizet,
      'time': time,
      'day': day,
      'typeappointment': typeappointment,
      'status': status,
      'namepaint': namepaint,
      'namespitizet': namespitizet,
      'imagepatint': imagepatint,
      'imagespitizet': imagespitizet
    });
  }

  Future<String> get userData async {
    final querySnapshot =
        await nutritionCollection.where('uid', isEqualTo: uid).get();
    return querySnapshot.docs[0]['type'];
  }

  Future<String> get userNama async {
    final querySnapshot =
        await nutritionCollection.where('uid', isEqualTo: uid).get();
    return querySnapshot.docs[0]['name'];
  }

  Future<String> get userImage async {
    final querySnapshot =
        await nutritionCollection.where('uid', isEqualTo: uid).get();
    return querySnapshot.docs[0]['myImage'];
  }

  Future<void> update(String key, String status) async {
    //return await appointmentCollection.doc(key).update({'status':'accept'});
    return await appointmentCollection.doc(key).update({'status': status});
  }
  Future<void> updateSubscribtion(String key, String subscribtion) async {
    //return await appointmentCollection.doc(key).update({'status':'accept'});
    return await chatCollection.doc(key).update({'subscribtion': subscribtion});
  }
  Future<void> addMessageChat(
    String key,
    String sender,
    String message,
    String messageTime,
  ) async {
    String docId = chatCollection.doc().id;

    return await chatCollection
        .doc(key)
    .collection("ChatModel")
    .doc(docId).set({
      'sender': sender,
      'message': message,
      'messageTime': messageTime,
      'messageId': docId,

    });
  }

  Future<void> addNewChat(
    String userLoginId,
    String nameOwnerItemUser,
    String nameUser,
    String lastMessage,
    String imageOwnerItem,
    String date,
    String imageUser,
      String subscribtion,
  ) async {
    String docId = chatCollection.doc().id;
    return await chatCollection.doc(docId).set({
      'chatId': docId,
      'userLoginId': userLoginId,
      'userOwnerItemId': uid,
      'nameOwnerItemUser': nameOwnerItemUser,
      'nameUser': nameUser,
      'lastMessage': lastMessage,
      'imageOwnerItem': imageOwnerItem,
      'date': date,
      'imageUser': imageUser,
      'subscribtion':subscribtion
    });
  }

  Future<String> chatColectId(String uidpatint) async {
    final querySnapshot =
    await chatCollection.where('userOwnerItemId', isEqualTo: uid)
        .where('userLoginId', isEqualTo: uidpatint).get();
    return querySnapshot.docs[0].id;
  }
  Future<String> chatColectSubscrib(String uidpatint) async {
    final querySnapshot =
    await chatCollection.where('userOwnerItemId', isEqualTo: uid)
        .where('userLoginId', isEqualTo: uidpatint).get();
    return querySnapshot.docs[0]['subscribtion'];
  }

  Future<void> addDitePlan(
      String name,
      String size,
      String kcal,
      String data,
      String completed,
      String patintId,


      ) async {
    String docId = planCollection.doc().id;
    return await planCollection.doc(docId).set({
      'id': docId,
      'name': name,
      'size': size,
      'kcal': kcal,
      'data': data,
      'completed': completed,
      'doctorId':uid,
      'patintId':patintId
    });
  }
  Future<void> updatecompleted(String key, String completed) async {
    //return await appointmentCollection.doc(key).update({'status':'accept'});
    return await planCollection.doc(key).update({'completed': completed});
  }
  Stream<QuerySnapshot<Map<String, dynamic>>>  getUserInfo(String userId) {
    return   FirebaseFirestore.instance.collection('user').where('uid', isEqualTo: userId).snapshots();
  }
  Future<void> addNewPost(
      String userimage,
      String username,
      String date,
      String decs,
      String postimage,
      String likecount,
      String accept


      ) async {
    String docId = postCollection.doc().id;
    return await postCollection.doc(docId).set({
      'id': docId,
      'userimage': userimage,
      'username': username,
      'date': date,
      'decs': decs,
      'postimage': postimage,
      'likecount':likecount,
      'accept':accept
    });
  }
  Future<void> updateLikeCount(String key, String likecount) async {
    //return await appointmentCollection.doc(key).update({'status':'accept'});
    return await postCollection.doc(key).update({'likecount': likecount});
  }
  Future<void> updatecaneSearch(String key, String caneSearch) async {
    //return await appointmentCollection.doc(key).update({'status':'accept'});
    return await nutritionCollection.doc(key).update({'caneSearch': caneSearch});
  }
  Future<void> updatePostStatus(String key, String accept) async {
    //return await appointmentCollection.doc(key).update({'status':'accept'});
    return await postCollection.doc(key).update({'accept': accept});
  }
  Future<void> updateUserImage(String myImage) async {
    return await nutritionCollection.doc(uid).update({'myImage': myImage});
  }
  Future<void> updateCover(String myCover) async {
    return await nutritionCollection.doc(uid).update({'myCover': myCover});
  }

}
