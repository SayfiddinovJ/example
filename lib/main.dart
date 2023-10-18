import 'package:example/bloc/product_bloc.dart';
import 'package:example/cubit/size_cubit.dart';
import 'package:example/cubit/tabs_box_cubit.dart';
import 'package:example/repositories/api_repository.dart';
import 'package:example/services/api_service.dart';
import 'package:example/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(apiService: ApiService()));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiRepository(apiService: apiService),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabsBoxCubit()),
          BlocProvider(create: (context) => SizeCubit()),
          BlocProvider(
            create: (context) => ProductBloc(
              apiRepository: context.read<ApiRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
