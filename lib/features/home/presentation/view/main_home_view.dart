import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_cubit.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/home_state.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/theme_cubit.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
              ),
            ),
            themeMode: themeState == ThemeState.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, homeState) {
                return Scaffold(
                  body: homeState.views[homeState.selectedIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: homeState.selectedIndex,
                    onTap: (index) {
                      context.read<HomeCubit>().onTabTapped(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: themeState == ThemeState.dark
                        ? Colors.black
                        : Colors.white,
                    selectedItemColor: themeState == ThemeState.dark
                        ? Colors.orange
                        : Colors.blue,
                    unselectedItemColor: themeState == ThemeState.dark
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                    showUnselectedLabels: true,
                    iconSize: 30,
                    elevation: 10,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home, size: 28),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.book, size: 28),
                        label: "Booking",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.info, size: 28),
                        label: "About Us",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person, size: 28),
                        label: "Profile",
                      ),
                    ],
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    child: Icon(
                      themeState == ThemeState.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
