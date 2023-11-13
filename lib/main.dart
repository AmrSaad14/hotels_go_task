import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels_go_task/bloc_observer.dart';
import 'package:hotels_go_task/view/screens/home_screen/home_screen.dart';
import 'package:hotels_go_task/view_model/cubit/home_cubit.dart';

GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //init screen util
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
            navigatorKey: navigatorkey,
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
