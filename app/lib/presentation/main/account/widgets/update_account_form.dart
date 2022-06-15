import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:horizon/application/auth/account/account_cubit.dart';
import 'package:horizon/application/auth/update_account/update_account_cubit.dart';
import 'package:horizon/presentation/common/utils/flushbar_creator.dart';
import 'package:horizon/presentation/common/widgets/navigation_appbar.dart';
import 'package:horizon/presentation/main/account/widgets/background_container.dart';
import 'package:horizon/presentation/main/account/widgets/update_account_field.dart';
import 'package:horizon/presentation/main/layout/window_wrapper.dart';

class UpdateAccountForm extends HookWidget {
  const UpdateAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    final account = context.read<AccountCubit>().state;

    useEffect(
      () {
        context.read<UpdateAccountCubit>().initialize(account);
        return null;
      },
      [account],
    );

    return BlocConsumer<UpdateAccountCubit, UpdateAccountState>(
      listenWhen: (p, c) =>
          p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (account) {
              // Store the account and go to the projects page
              context.read<AccountCubit>().setAccount(account);
              buildSuccesFlushbar(message: "Successfully updated your account")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: WindowWrapper(
            appBar: NavigationAppbar(
              title: "Account",
              controller: _scrollController,
            ),
            controller: _scrollController,
            children: [
              BackgroundContainer(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(account.image),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  UpdateAccountFormField(
                    label: "E-Mail",
                    initialValue: state.emailAddress.getOrCrash(),
                    onChanged: (value) =>
                        context.read<UpdateAccountCubit>().emailChanged(value),
                    validator: () => context
                        .read<UpdateAccountCubit>()
                        .state
                        .emailAddress
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  UpdateAccountFormField(
                    label: "Username",
                    initialValue: state.username.getOrCrash(),
                    onChanged: (value) => context
                        .read<UpdateAccountCubit>()
                        .usernameChanged(value),
                    validator: () => context
                        .read<UpdateAccountCubit>()
                        .state
                        .username
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidUsername: (_) => 'Invalid Username',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () => context
                              .read<UpdateAccountCubit>()
                              .updateAccount(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: const Text(
                              "Save Changes",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
