import 'package:get_it/get_it.dart';
import 'package:habit_tracker/bloc/habit_cubit.dart';
import 'package:habit_tracker/repository/habit_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton(() => prefs);

  locator.registerSingleton(
    HabitRepository(prefs: locator<SharedPreferences>()),
  );

  locator.registerSingleton(HabitCubit(habitRepository: locator()));
}
