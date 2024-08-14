import 'package:bloc/bloc.dart';
import 'package:travego/features/search/repo/search_repo.dart';
import 'package:travego/model/remote/search/trip_search_model.dart';

import '../../../../core/utils/shared/constant.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  TripSearchModel tripSearchModel = TripSearchModel(message: 'message', status: 'status', localDateTime: 'localDateTime', body: []);

  Future<void> searchByTrip({required String text})async{
    emit(SearchLoadingState());
    var result = await searchRepo.searchByTrip(text: text, token: token);
    result.fold((failure) {
      emit(SearchFailureState(errMessage: failure.errMessage));
    },
            (response) {
      tripSearchModel = TripSearchModel.fromJson(response.data);
            }
    );
    emit(SearchSuccessState());
  }
}
