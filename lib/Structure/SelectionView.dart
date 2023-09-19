import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:falcon_net/Structure/Components/FNPrivacy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/Store/Endpoints.dart';

class SelectionView extends StatelessWidget {
  final Function() onSigned;
  final Function() onDemo;

  const SelectionView({Key? key, required this.onSigned, required this.onDemo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1578983946265-f2475ea35ef9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80',
              fit: BoxFit.cover,
              color: const Color(0xff000069).withOpacity(0.2),
              colorBlendMode: BlendMode.colorDodge,
            ),
          ),
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withOpacity(.2),
            ),
          ),
          Positioned(
            bottom: kIsWeb ? null : 0,
            width: kIsWeb ? 450 : MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon/FalconNet-IOS-2.png',
                          width: 60,
                        ),
                        const SizedBox(width: 14),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FalconNet 2.0',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'Sign in to continue.',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 2),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SignInButton(
                      label: 'Sign in with USAFA',
                      icon: SvgPicture.asset('assets/icon/microsoft.svg'),
                      onPressed: () => HapticFeedback.lightImpact().then(
                        (_) => showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                primary: false,
                                children: [
                                  Text(
                                    "FalconNet Data Consent",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "You are accessing an Information System (IS) that is provided for United States"
                                    " Air Force Academy-authorized use only. To learn"
                                    " more about how FalconNet uses permissions and connections granted by the user, "
                                    "please read FalconNet's Privacy Policy and Transparency Guide. "
                                    "When you select 'Accept' or access FalconNet affiliated data sources "
                                    "you are agreeing to FalconNet's Terms of Use.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(height: 1.4),
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 10),
                                      ),
                                    ),
                                    onPressed: () async => showDialog(
                                      context: context,
                                      builder: (context) => const FNPrivacy(),
                                    ),
                                    child: const Text(
                                      "View Privacy Policy",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  ElevatedButton(
                                    style: const ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      await attemptLogin();
                                      onSigned();
                                    },
                                    child: const Text(
                                      "Accept",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SignInButton(
                      label: 'Demo mode (Apple)',
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: SvgPicture.asset('assets/icon/apple.svg'),
                      ),
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      onPressed: onDemo,
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'v2.0. Made by HavocDevelopment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.label,
    this.icon,
    this.fillColor,
    this.textColor,
    this.onPressed,
    super.key,
  });

  final String label;
  final Widget? icon;
  final Color? fillColor, textColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: BouncingWidget(
        scaleFactor: 0.4,
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed?.call();
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: fillColor ?? const Color(0xff000080),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffe8e8e8), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: -10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: textColor ?? Colors.white,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
