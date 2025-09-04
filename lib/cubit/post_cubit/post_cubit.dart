import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:task6/cubit/post_cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(LoadingPostStatae());
  Future<void> upLoadPost() async {
    try {
      final response = await get(
        Uri.parse("https://dummyjson.com/products"),
        headers: {"Accept": "application/json"},
      );
      final responseBody = jsonDecode(response.body);
      List responseData=responseBody["products"];
      emit(SucsessPostStatae(products:responseData ));
    } catch (e) {
      emit(ErrorPostStatae(error: e.toString()));
    }
  }
}
