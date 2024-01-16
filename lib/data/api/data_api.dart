import 'dart:math';

import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();
  //Lista de entradas
  List<Entry> entries = [];

  //Função para retornar e preencher as entries com algum valor
  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    //Buscando na API a categoria
    final response = await dio.get(url + category);
    entries = List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
    return entries;
  }
}