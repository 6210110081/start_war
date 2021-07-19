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
  // late int _page;

  _StarwarsListState() : _repo = new StarwarsRepo();

  @override
  void initState() {
    super.initState();
    // _page = 1;
    _people = [];
    freshPeople();
  }

  Future<void> freshPeople() async {
    var people = await _repo.repoPeopleStarwar();
    setState(() {
      _people = List<People>.from(_people);
      _people.addAll(people);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _people.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("${_people[index].name}"),
          ]),
        );
      },
    );
  }
}
