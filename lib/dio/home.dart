import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'module/user.dart';
import 'module/user_reponse.dart';
import 'user_provider.dart';

class Dio extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: 'abc',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = UserBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: StreamBuilder<UserResponse>(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<UserResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return _buildErrorWidget(snapshot.data.error);
            }
            return _buildUserWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else {
            return _buildLoadingWidget();
          }
        },
      ),
    );
  }
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."), CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }
  Widget _buildUserWidget(UserResponse data) {
    User user = data.results[0];
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: NetworkImage(user.picture.large),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                  user.name.title
                  + ' ' + user.name.first
                  + ' ' + user.name.last,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                  user.email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                  user.location.state,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ));
  }
}
