import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/habit_state.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/repository/habit_repository.dart';

class HabitCubit extends Cubit {
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
    final List<HabitModel> newHabits = List.from(state.habits)..remove(habit);
    await habitRepository.addOrRemoveHabit(newHabits);
    emit(state.copyWith(newHabits));
  }

  void updateHabit(HabitModel habit) async {
    final List<HabitModel> newHabits = List.from(state.habits);
    final int index = newHabits.indexWhere((element) => element.habitName == habit.habitName);
    newHabits[index] = habit;
    await habitRepository.addOrRemoveHabit(newHabits);
    emit(state.copyWith(newHabits));
  }
}
