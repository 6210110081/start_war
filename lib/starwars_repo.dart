import 'package:dio/dio.dart';

class People {
  String name;
  People(this.name);
}

class StarwarsRepo {
  var dio = Dio();
  Future<List<dynamic>> repoPeopleStarwar() async {
    var response = await dio.get('https://swapi.dev/people');
    print('date = ' + response.data);
    List<dynamic> peopleStarwars = response.data;
    return peopleStarwars;
  }
}
