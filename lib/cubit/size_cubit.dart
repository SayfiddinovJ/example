import 'package:flutter_bloc/flutter_bloc.dart';

class SizeCubit extends Cubit<String> {
  SizeCubit() : super('');

  setSize(String size) {
    emit(size);
  }
}
