import 'package:dio/dio.dart';

class People {
  final String name;
  People(this.name);

  factory People.fromJson(dynamic data) {
    return People(data['name']);
  }
}

class StarwarsRepo {
  var dio = Dio();
  Future<List<People>> repoPeopleStarwar() async {
    var response = await dio.get('https://swapi.dev/api/people');
    print(response);
    List<dynamic> peopleStarwars = response.data['results'];
    return peopleStarwars.map((e) => People.fromJson(e)).toList();
  }
}
