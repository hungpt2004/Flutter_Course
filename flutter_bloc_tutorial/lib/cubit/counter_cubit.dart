import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {

  // Bắt đầu với giá trị khởi tạo là 0
  CounterCubit() : super(0);

  // Hàm để tăng giá trị bộ đếm
  void increment() => emit(state + 1);

  // Hàm để giảm giá trị bộ đếm
  void decrement() => emit(state - 1);

  // Hàm để reset giá trị
  void reset() => emit(0);
}
