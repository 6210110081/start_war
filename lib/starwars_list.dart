import 'package:flutter/cupertino.dart';
import 'package:star_war/starwars_repo.dart';

class StarwarsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StarwarsListState();
  }
}

class _StarwarsListState extends State<StarwarsList> {
  late final StarwarsRepo _repo;
  @override
  Future<void> fetch() async {
    var people = await _repo.repoPeopleStarwar();
    print(people);
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Page Startwars List'),
      ],
    );
  }
}
