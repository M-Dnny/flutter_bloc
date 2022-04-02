// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class DataModel with _$DataModel {
  factory DataModel(
      {required int id,
      required String title,
      required String worth,
      required String thumbnail,
      required String image,
      required String description,
      required String instructions,
      required String open_giveaway_url,
      required String published_date,
      required String type,
      required String platforms,
      required String end_date,
      required int users,
      required String status,
      required String gamerpower_url}) = _$_DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
