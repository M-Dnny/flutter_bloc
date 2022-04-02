import 'dart:convert';

import 'package:flutter_weather_bloc/models/data_model.dart';
import 'package:http/http.dart' as http;

class GamesRepo {
  Future<List<DataModel>?> getGamesData() async {
    var client = http.Client();

    var url = Uri.parse('https://www.gamerpower.com/api/giveaways');
    var response = await client.get(
      url,
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    if (response.statusCode != 200) {
      return null;
    } else {
      var models = response.body;
      return dataModelFromJson(models);
    }
  }
}



// import 'dart:convert';

// import 'package:flutter_weather_bloc/models/data_model.dart';
// import 'package:http/http.dart' as http;

// class GamesRepo {
//   Future<List<DataModel>?> getGamesData() async {
//     String url = "https://www.gamerpower.com/api/giveaways";
//     final result = await http.Client().get(Uri.parse(url));
//     if (result.statusCode != 200) { 
//       return null;
//     } else {
//       Iterable models = jsonDecode(result.body);
//       List<DataModel> dataModels = [];
//       for (var model in models) {
//         DataModel dataModel = DataModel.fromJson(model);
//         dataModels.add(dataModel);
//       }
//       return dataModels;
//     }
//   }
// }
