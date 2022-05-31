part of 'SearchBloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<AccountModel> accountList;
  const SearchLoaded(this.accountList);
}

class SearchError extends SearchState {
  final String? message;
  const SearchError(this.message);
}

class FilterError extends SearchState {
  final String? message;
  const FilterError(this.message);
}