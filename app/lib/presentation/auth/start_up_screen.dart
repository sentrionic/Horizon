import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/presentation/auth/widgets/auth_wrapper.dart';
import 'package:horizon/presentation/routes/router.gr.dart';

class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWrapper(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Horizon",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Millions of songs.\nFree on Horizon.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
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
                    onPressed: () => AutoRouter.of(context)
                        .replace(const LoginScreenRoute()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextButton(
                    onPressed: () => AutoRouter.of(context)
                        .replace(const RegisterScreenRoute()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        "SIGNUP",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
