import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'archieve_page_viewmodel.dart';

class ArchievePageView extends StackedView<ArchievePageViewModel> {
  const ArchievePageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ArchievePageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => viewModel.navigateBack(),
          ),
          title: const Text("Profile"),
          centerTitle: true,
        ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                itemCount: viewModel.archivedLength,
                itemBuilder: (context, index){
                    final entry = viewModel.entriesArchieve[index];
                    return Column(
                      children: [
                        SizedBox(height: 5.0,),
                        Divider(),
                        ListTile(
                          title: Text(
                              entry.title.isNotEmpty
                                  ? entry.title : "No Title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                          subtitle: Text(entry.content,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                          trailing: Column(
                            children: [
                              Text(entry.date.toLocal().toString().split("")[0]),
                              IconButton(
                                  onPressed: () => viewModel.toggleFavorite(entry),
                                  icon: Icon(Icons.favorite,
                                  color: entry.isfavorite ? Colors.red : null,)),

                            ],
                          ),
                          onTap: () => viewModel.openText(entry: entry),
                        )
                      ],
                    );
                },)
              ],
            ),
      ))
    );
  }

  @override
  ArchievePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ArchievePageViewModel();
}
