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
  late final StarwarsRepo _repo;
  late List<People> _people;
  late int _page;

  _StarwarsListState() : _repo = new StarwarsRepo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Page Startwars List'),
        FlatButton(
            onPressed: () async {
              await _repo.repoPeopleStarwar();
            },
            child: Text('Check'))
      ],
    );
  }
}
