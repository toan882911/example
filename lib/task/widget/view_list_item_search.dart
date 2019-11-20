import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/department_model.dart';

class ViewListItemSearch extends StatefulWidget {

  final DepartmentModel model;
  final bool isSelected;
  final VoidCallback onTap;

  ViewListItemSearch({this.model, this.isSelected, this.onTap});

  @override
  _ViewListItemSearchState createState() => _ViewListItemSearchState();
}

class _ViewListItemSearchState extends State<ViewListItemSearch> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${widget.model.title}', style: TextStyle(
          color: Colors.black,
          fontSize: 12.0
      ),),
      trailing: widget.isSelected
          ? Icon(Icons.check)
          : Text(''),
      onTap: widget.onTap,
    );
  }


}
