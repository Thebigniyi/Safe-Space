import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () => viewModel.scaffoldKey.currentState!.openDrawer(),
            child: CircleAvatar(
              radius: 40.0,
              child: Text(viewModel.initialLetter),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  MaterialButton(
                      onPressed: (){},
                    color: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text("Favorites", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(width: 15.0,),
                  MaterialButton(
                    onPressed: () => viewModel.navigateToArchieve(),
                    color: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text("Archives", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.entriesLength,
                itemBuilder: (context, index) {
                  final entry = viewModel.entries[index];
                  return Dismissible(
                    key: Key(index.toString()),
                    background: Container(
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.archive,
                        color: Colors.black,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        viewModel.archieveEntry(entry);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$entry archived"),
                        ));
                      } else if (direction == DismissDirection.startToEnd) {
                        viewModel.removeEntry(entry);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$entry deleted"),
                        ));
                      }
                    },
                    child: Column(
                      children: [
                        const Divider(),
                        ListTile(
                          title: Text(
                            entry.title.isNotEmpty ? entry.title : "No title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            entry.content,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ), // Show only the date part
                          trailing: Column(
                            children: [
                              Text(
                                entry.date.toLocal().toString().split(' ')[0],
                              ),
                              const SizedBox(
                                height: 1.0,
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.favorite),
                                  color: entry.isfavorite ? Colors.red : null,
                                  onPressed: () =>
                                      viewModel.toggleFavorite(entry),
                                ),
                              ),
                            ],
                          ),
                          onTap: () => viewModel.openText(entry: entry),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade300,
        // width: 40.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.share),
                title: Text(
                  "Share events",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.favorite),
                title: Text(
                  "Favorites",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.archive),
                title: Text(
                  "Archive",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.lock),
                title: Text(
                  "Lock events",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.create),
                title: const Text(
                  "Create pin",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.calendar_month),
                title: const Text(
                  "Set calendar",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(5.0),
                leading: Icon(Icons.logout),
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => viewModel.openText(),
        child: const CircleAvatar(
          radius: 50.0,
          child: Icon(
            Icons.add,
            size: 30.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        elevation: 10,
        clipBehavior: Clip.none,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2.0, bottom: 2.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_sharp,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 2.0, bottom: 2.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                    onPressed: () => viewModel.navigateToProfile(),
                    icon: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
  }
}
