import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star_war/starwars_repo.dart';

class StarwarsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StarwarsListState();
  }
}

class _StarwarsListState extends State<StarwarsList> {
  final StarwarsRepo _repo;
  late List<People> _people;
  late int _page;
  late bool _end;

  _StarwarsListState() : _repo = new StarwarsRepo();

  @override
  void initState() {
    super.initState();
    _page = 1;
    _people = [];
    freshPeople();
    _end = false;
  }

  Future<void> freshPeople() async {
    var people = await _repo.repoPeopleStarwar(_page);
    setState(() {
      _people = List<People>.from(_people);
      _people.addAll(people);
      _page = _page + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < _people.length) {
          return Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Image.network(
                    'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                    height: 200,
                    width: 200,
                  ),
                ),
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_people[index].name}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "Height : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${_people[index].height}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Gender : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${_people[index].gender}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Mass : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${_people[index].mass}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Birth Year : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Birth Year : ${_people[index].bday}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          freshPeople();
          return Center(child: CircularProgressIndicator());
        }
      },
      itemCount: _people.length + 1,
    );
  }
}
