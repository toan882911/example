import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/department_model.dart';
import 'package:flutter_test_textfield/task/widget/view_list_item_search.dart';

class ListItemSearch extends StatefulWidget {

  ListItemSearch(this.data);
  final List<DepartmentModel> data;

  @override
  _ListItemSearchState createState() => _ListItemSearchState(data);
}

class _ListItemSearchState extends State<ListItemSearch> {

  _ListItemSearchState(this.data);
  final List<DepartmentModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => ViewListItemSearch()
    );
  }


}