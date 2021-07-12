import 'package:dio/dio.dart';

class People {
  String name;
  People(this.name);
}

class StarwarsRepo {
  var dio = Dio();
  Future<List<People>> repoPeopleStarwar() async {
    var response = await dio.get('https://swapi.dev/people');
    print(response);
    List<People> peopleStarwars = [];
    return peopleStarwars;
  }
}
