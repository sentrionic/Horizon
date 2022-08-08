import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/auth_status/auth_status_bloc.dart';
import 'package:horizon/domain/auth/account.dart';
import 'package:horizon/presentation/core/app_colors.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, Account>(
      buildWhen: (p, c) => p.id != c.id,
      builder: (context, state) {
        return Align(
          child: PopupMenuButton<int>(
            color: ThemeColors.dialogColor,
            elevation: 0,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const SizedBox(
                  width: 120,
                  child: Text("Account"),
                ),
                onTap: () => context.pushRoute(const AccountScreenRoute()),
              ),
              PopupMenuItem(
                child: const Text("Profile"),
                onTap: () => context.pushRoute(ArtistScreenRoute(id: state.id)),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: const Text("Logout"),
                onTap: () => context.read<AuthStatusBloc>().add(
                      const AuthStatusEvent.signedOut(),
                    ),
              ),
            ],
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: ThemeColors.accountButton,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 13,
                      backgroundImage: NetworkImage(state.image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      state.username.getOrCrash(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 26.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
