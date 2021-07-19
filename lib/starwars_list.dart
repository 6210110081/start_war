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

  _StarwarsListState() : _repo = new StarwarsRepo();

  @override
  void initState() {
    super.initState();
    _page = 1;
    _people = [];
    freshPeople();
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
              children: [
                Flexible(
                  flex: 1,
                  child: Card(
                    child: Image.network(
                      'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${_people[index].name}"),
                      Text("${_people[index].gender}")
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
