import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_bloc_observer.dart';
import 'core/service/service_locator.dart';
import 'features/view/medical_nav_bar.dart';
import 'features/viewmodel/prediction_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MultiBlocProvider(
        providers: [BlocProvider<PredictionCubit>(create: (context) => getIt<PredictionCubit>())],
        child: const HealAi(),
      ),
    ),
  );
}

class HealAi extends StatelessWidget {
  const HealAi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Medical Detection',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFF8FAFC),
          ),
          home: const MedicalNavBar(),
        );
      },
    );
  }
}
