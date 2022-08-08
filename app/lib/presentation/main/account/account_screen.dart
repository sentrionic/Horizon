import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/update_account/update_account_cubit.dart';
import 'package:horizon/injection.dart';
import 'package:horizon/presentation/main/account/widgets/update_account_form.dart';
import 'package:horizon/presentation/main/layout/app_layout.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UpdateAccountCubit>(),
      child: const AppLayout(
        child: UpdateAccountForm(),
      ),
    );
  }
}
