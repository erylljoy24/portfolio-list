import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_fliter/data/models/AccountModel.dart';
import 'package:search_fliter/data/respository/ApiRepo.dart';

part 'SearchEvent.dart';
part 'SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    final ApiRepo apiRepo = ApiRepo();

    on<GetAccountList>((event, emit) async {
      try {
        emit(SearchLoading());
        final list = await apiRepo.fetchAccountList();
        emit(SearchLoaded(list));
        if (list.isEmpty) {
          emit(const SearchError("Error Fetch"));
        }
      } on NetworkError {
        emit(const SearchError("Error Fetch"));
      }
    });
  }
}