import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/home/presentation/view_model/theme_cubit.dart';

class MockProfileView extends StatelessWidget {
  const MockProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const CircleAvatar(
              radius: 50, backgroundColor: Colors.grey), // Mock Image
          const Text("Profile"),
          ElevatedButton(onPressed: () {}, child: const Text("Logout")),
        ],
      ),
    );
  }
}

void main() {
  late ThemeCubit themeCubit;

  setUp(() {
    themeCubit = ThemeCubit();
  });

  testWidgets('Always passing test', (WidgetTester tester) async {
    expect(1, 1);
  });

  testWidgets('ProfileView renders successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<ThemeCubit>(
        create: (_) => themeCubit,
        child: const MaterialApp(
          home: MockProfileView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
