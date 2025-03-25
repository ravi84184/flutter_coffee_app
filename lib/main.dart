import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/injection_container.dart' as di;
import 'presentation/bloc/product_bloc.dart';
import 'presentation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ProductBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Coffee App',
        theme: ThemeData(
          primaryColor: const Color(0xFF6B4731),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6B4731),
            primary: const Color(0xFF6B4731),
            secondary: const Color(0xFFC67C4E),
          ),
          fontFamily: 'Gilroy',
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
