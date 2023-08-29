// import 'dart:developer';

//  import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:pprab/api_service/confi.dart';
// import 'package:pprab/models/client_model.dart';




// class RegisterUser{

//  Future<List<Client>?> postUsers() async {
//     try {
//       final url = Uri.parse(ApiConstants.signUp);
//       final response = await http.post(url);
//       if (response.statusCode == 200) {
//         List<Client> _model = userModelFromJson(response.body);
//         return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }




// }