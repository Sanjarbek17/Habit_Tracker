import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/habit_state.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/repository/habit_repository.dart';

class HabitCubit extends Cubit<HabitState> {
  final HabitRepository habitRepository;
  HabitCubit({required this.habitRepository}) : super(HabitState(habits: []));

  void addHabit(HabitModel habit) async {
    final List<HabitModel> newHabits = List.from(state.habits)..add(habit);
    await habitRepository.addOrRemoveHabit(newHabits);
    emit(state.copyWith(newHabits));
  }

  void getHabits() async {
    final List<HabitModel> habits = await habitRepository.getHabits();
    emit(state.copyWith(habits));
  }

  void removeHabit(HabitModel habit) async {
    state.habits.remove(habit);
    await habitRepository.addOrRemoveHabit(state.habits);
    emit(state.copyWith(state.habits));
  }

  void updateHabit(HabitModel habit) async {
    final List<HabitModel> newHabits = List.from(state.habits);
    final int index = newHabits.indexWhere((element) => element == habit);
    newHabits[index] = habit;
    await habitRepository.addOrRemoveHabit(newHabits);
    emit(state.copyWith(newHabits));
  }
}
