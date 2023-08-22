import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/app_response.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_provider.dart';
import '../viewmodel/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenProvider homeScreenProvider = HomeScreenProvider();

  @override
  void initState() {
    // TODO: implement initState
    homeScreenProvider.getUserListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userpref = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                userpref.remove().then((value) {
                  Navigator.pushReplacementNamed(
                      context, RouteName.loginscreen);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ChangeNotifierProvider<HomeScreenProvider>(
        create: (BuildContext context) => homeScreenProvider,
        child: Consumer<HomeScreenProvider>(builder: (context, value, child) {
          switch (value.userList.status) {
            case Status.LOADING:
              return Center(
                child: Image.network("https://i.gifer.com/XOsX.gif"),
              );
            case Status.ERROR:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.red, size: 200),
                    ElevatedButton.icon(
                        onPressed: () {
                          homeScreenProvider.getUserListApi();
                          debugPrint("api re-hit");
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          backgroundColor: Colors.teal[200],
                          foregroundColor: Colors.black,
                        ),
                        icon: const Icon(Icons.restart_alt),
                        label: const Text(
                          "Re - try",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              );
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.userList.data!.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 5, bottom: 10),
                              // height: MediaQuery.of(context).size.height * 0.2,
                              // width: MediaQuery.of(context).size.width * 0.6,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ID : ${value.userList.data!.data![index].id} ",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Divider(),
                                  Text(
                                    "Name : ${value.userList.data!.data![index].firstName} ${value.userList.data!.data![index].lastName}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Divider(),
                                  Text(
                                    "${value.userList.data!.data![index].email}",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            child: Stack(
                              children: [
                                const CircularProgressIndicator(),
                                Builder(
                                  builder: (context) {
                                    return Image.network(
                                      value.userList.data!.data![index].avatar
                                          .toString(),
                                      // height: 150,
                                      fit: BoxFit.fitHeight,
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}
