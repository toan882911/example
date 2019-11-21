import 'package:flutter/material.dart';
import 'package:flutter_test_textfield/task/data/model/department_model.dart';
import '../constrain.dart';
import 'view_list_item_search.dart';

class DepartmentSearchWidget extends StatefulWidget {

  final DepartmentModel currentDep;

  DepartmentSearchWidget(this.currentDep);

  @override
  _DepartmentSearchWidgetState createState() => _DepartmentSearchWidgetState();
}

class _DepartmentSearchWidgetState extends State<DepartmentSearchWidget> {

  DepartmentModel currentDep;

  List<DepartmentModel> departments = []
  ..add(DepartmentModel('Ban Lãnh Đạo',false))
  ..add(DepartmentModel('Lãnh đạo Cty Thành Viên',false))
  ..add(DepartmentModel('Thư Ký - Trợ Lý CT HDQT',false))
  ..add(DepartmentModel('Thư Ký - Trợ Lý TGĐ/Phó TGĐ',false))
  ..add(DepartmentModel('Phòng Văn Thư ',false))
  ..add(DepartmentModel('Ban Kế Toán ',false))
  ..add(DepartmentModel('Phòng Nhân Sự ',false))
  ..add(DepartmentModel('Phòng Hành Chính ',false))
  ..add(DepartmentModel('Ban Pháp Chế',false))
  ..add(DepartmentModel('Phòng IT',false))
  ..add(DepartmentModel('Ban Kễ Hoạch - Kỹ Thuật',false))
  ..add(DepartmentModel('Ban Thiết Kế',false))
  ..add(DepartmentModel('Khối Kinh Doanh',false));

  @override
  void initState() {
    super.initState();
    currentDep = widget.currentDep;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Material(
          color: Colors.deepPurple,
          child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Text('Huỷ bỏ',style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white
                      ),),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Phòng Ban',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop(currentDep);
                      },
                      child: Container(
                          height: 32.0,
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                          ),
                          child: Center(
                            child: Text(
                              'Chọn',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
        preferredSize: Size.fromHeight(kSizeBar),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ViewListItemSearch(
              model: departments[index],
              isSelected: departments[index].title == currentDep.title,
              onTap: () {
                setState(() {
                  currentDep = departments[index];
                });
              },
            );
          },
        itemCount: departments.length,
      ),
    );
  }
}