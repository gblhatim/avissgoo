import 'package:app/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginlist.dart';
import 'models/User.dart';

class StatsPage extends StatelessWidget {
  final User user;
  const StatsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Stats Page"));
  }
}
