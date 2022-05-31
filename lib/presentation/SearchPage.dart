import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_fliter/bloc/SearchBloc.dart';
import 'package:search_fliter/data/models/AccountModel.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBloc _searchBloc = SearchBloc();

  @override
  void initState() {
    _searchBloc.add(GetAccountList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Filter')),
      body: _searchListWidget(),
    );
  }

  Widget _searchListWidget() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _searchBloc,
        child: BlocListener<SearchBloc, SearchState>(
          listener: (context, state) {
            if (state is SearchError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return _buildLoading();
              } else if (state is SearchLoading) {
                return _buildLoading();
              } else if (state is SearchLoaded) {
                return _displayList(context, state.accountList);
              } else if (state is SearchError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        )
      ),
    );
  }

  Widget _displayList(BuildContext context, List<AccountModel> list){
    return ListView.builder(
      itemCount: list.length,
        itemBuilder: (context, index) {
          AccountModel model = list[index];
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("Name: ${model.name}"),
                    Text(
                        "Description: ${model.description}"),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}