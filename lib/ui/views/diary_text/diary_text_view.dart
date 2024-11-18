import 'package:diary_project/ui/views/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'diary_text_viewmodel.dart';

class DiaryTextView extends StackedView<DiaryTextViewModel> {
  final DiaryEntry? entry;
  const DiaryTextView({Key? key, this.entry}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DiaryTextViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => viewModel.back(),
        ),
        title: const Text(
          "Your can keep it here...",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: viewModel.title,
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  enableSuggestions: true,
                  minLines: 2,
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Title",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  controller: viewModel.subTitle,
                  keyboardType: TextInputType.multiline,
                  autocorrect: true,
                  enableSuggestions: true,
                  minLines: 25,
                  maxLines: 40,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Write here",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Please fill in fields"
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            entry == null ? viewModel.saveDiary() : viewModel.editDiary(),
        child: Text("Save"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  DiaryTextViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DiaryTextViewModel();

  @override
  void onViewModelReady(DiaryTextViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.initState(entry);
    super.onViewModelReady(viewModel);
  }
}
