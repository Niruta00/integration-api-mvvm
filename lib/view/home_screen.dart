import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqres_api_integration/data/response/status.dart';
import 'package:reqres_api_integration/model/user_model.dart';
import 'package:reqres_api_integration/utils/routes/routes_name.dart';
import 'package:reqres_api_integration/view_model/home_view_model.dart';
import 'package:reqres_api_integration/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    // homeViewModel.userList;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userPreference = Provider.of<UserModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("LogOut"),
        automaticallyImplyLeading: true,
        actions: [
          InkWell(
            onTap: () {
              // userPreference.remove().then((value) {
              //   Navigator.pushNamed(context, RoutesName.login);
              // });
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          value.requestApi();

       if()

          return ListView.builder(
            itemCount: value.userList.data!.data!.length,
            
            itemBuilder: (context, index) {
            
            return ListTile(
              title: Text(value.userList.data!.data.toString()),
            );
          });
        },
      ),

      // body: ChangeNotifierProvider<HomeViewModel>(
      //   create: (context) => HomeViewModel(),
      //   child: Consumer<HomeViewModel>(
      //     builder: (context, value, _) {
      //       switch (value.userList.status) {
      //         case Status.LOADING:
      //           return CircularProgressIndicator();
      //           case Status.ERROR:
      //           return CircularProgressIndicator();
      //           case Status.COMPLETED:
      //           return CircularProgressIndicator();
      //       }
      //       return Container();
      //     },
      //   ),
      // ),
      // body: Column(
      //   children: [
      //     Container(
      //       height: 500,
      //       color: Colors.deepOrangeAccent,
      //     )
      //   ],
      // ),
    );
  }
}
