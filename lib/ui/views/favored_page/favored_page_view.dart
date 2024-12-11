import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'favored_page_viewmodel.dart';

class FavoredPageView extends StackedView<FavoredPageViewModel> {
  const FavoredPageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    FavoredPageViewModel viewModel,
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
          title: const Text("Archived"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.favoredEntrieLength,
                    itemBuilder: (context, index) {
                      final entry = viewModel.favoredEntries[index];
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
                            viewModel.archiveEntry(entry);
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
                  )
                ],
              ),
            ))
    );
  }

  @override
  FavoredPageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      FavoredPageViewModel();
}
