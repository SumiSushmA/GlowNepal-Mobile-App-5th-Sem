import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  /// **Add New Booking**
  void addBooking(Map<String, dynamic> booking) {
    List<Map<String, dynamic>> updatedBookings = List.from(state.bookings)
      ..add(booking);
    emit(state.copyWith(
        bookings: updatedBookings, selectedIndex: 1)); // Go to Bookings tab
  }

  /// **Delete Appointment**
  void deleteBooking(int index) {
    List<Map<String, dynamic>> updatedBookings = List.from(state.bookings)
      ..removeAt(index);
    emit(state.copyWith(bookings: updatedBookings));
  }

  /// **Edit Appointment**
  void editBooking(int index, Map<String, dynamic> updatedBooking) {
    List<Map<String, dynamic>> updatedBookings = List.from(state.bookings);
    updatedBookings[index] = updatedBooking;
    emit(state.copyWith(bookings: updatedBookings));
  }
}
