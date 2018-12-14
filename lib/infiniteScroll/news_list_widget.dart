import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/common/error_text_widget.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';

class NewsListWidget extends StatelessWidget {
  List<int> itemList = List();
  bool isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    NewsListBloc newsListBloc = BlocProvider.of<NewsListBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          isLoading = !isLoading;
          newsListBloc.fetchNewsItems("new");
        }
      }
    });
    newsListBloc.fetchNewsItems("new");
    print("================ INITIAL API CALL");
    return StreamBuilder(
        initialData: IntEventModel(true, null, null),
        stream: newsListBloc.eventStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          IntEventModel model = snapshot.data;
          if (model.progress) {
            print("================ ============ API CALL ON  PROGRESS");

            return _buildList(newsListBloc, this.itemList, false);
          } else if (model.response != null) {
            print("================ ============ API CALL RESPONSE CAME");
            return _buildList(newsListBloc, model.response, true);
          } else {
            print("================ ============ API CALL ERROR OCCURE");
            return ErrorTextWidget(model.error);
          }
        });
  }

  Widget _buildList(
      NewsListBloc newsListBloc, List<int> itemList, bool updateList) {
    newsListBloc.updateItemList(this.itemList, itemList, updateList);
    return StreamBuilder(
      initialData: this.itemList,
      stream: newsListBloc.intCountStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(
            "==================== ==================== ==================== ITEMS RETRIVED ");
        this.itemList = snapshot.data;
        isLoading = false;
        return ListView.builder(
            controller: _scrollController,
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) =>
                Text("Item ${itemList[index]}"));
      },
    );
  }
}
