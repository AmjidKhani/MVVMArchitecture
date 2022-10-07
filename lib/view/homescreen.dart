import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvmarchi/data/response/status.dart';

import 'package:provider/provider.dart';

import '../viewmodel/Home_View_Model.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    homeViewViewModel.FetchDatalist();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (
          BuildContext context,
        ) =>
            homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (BuildContext context, value, _) {
            switch (value.movirslist.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text(value.movirslist.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.movirslist.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(value
                              .movirslist.data!.data![index].firstName
                              .toString()),
                          subtitle: Text(value
                              .movirslist.data!.data![index].email
                              .toString()),
                          trailing: Text(value.movirslist.data!.data![index].id
                              .toString()),
                        ),
                      );
                    });

              default:
                return const Text("No Data Found");
            }
            //  return Container();
          },
        ),
      ),
    );
  }
}
