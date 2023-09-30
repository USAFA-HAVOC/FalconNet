import 'package:flutter/material.dart';

class FNPrivacy extends StatelessWidget {
  const FNPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: CloseButton(),
          ),

          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "FalconNet Privacy Statement",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 20,),

                  const Text(
                      """Authority: HQ UNITED STATES AIR FORCE ACADEMY MISSION DIRECTIVE 3, Commandant of Cadets, paragraphs 3.4 and 3.5; Privacy Act of 1974; AFCWI 36-3501 Cadet Standards and Duties
Purpose: FalconNet, a web-based application operated by the U.S. Air Force, is designed to enhance the operational efficiency of the USAFA Cadet Wing (AFCW) and the permanent party (CW) chain. The app facilitates accountability, dormitory standards tracking, and unit management by collecting and utilizing cadet information.
Routine Use: Disclosure of collected data may occur under the following circumstances:
Disclosure: User disclosure of PII (Personally Identifiable Information) is voluntary. However, failure to furnish the requested information may affect the efficiency of accountability, dormitory standards tracking, and unit management functions provided by FalconNet.
Disclosure: Personal information collected by FalconNet may be disclosed to USAFA Permanent Party and authorized USAF authorities for the purpose of maintaining unit good order and discipline, training, development, and mentoring in accordance with HQ UNITED STATES AIR FORCE ACADEMY MISSION DIRECTIVE 3, paragraphs 3.4 and 3.5. Such disclosures are subject to appropriate legal and ethical controls to ensure that the use of the information complies with relevant laws, military directives, and privacy rights.
System of Records Notice: As defined in FalconNet’s Privacy Policy dated March 3, 2021.
User Consent to Collection and Disclosure of PII: By using FalconNet, users consent to the collection, use, maintenance, dissemination, and retention of PII for the purpose of account identification, processing and management of unit functions, and generating reports for accountability, dormitory standards tracking, and unit management. PII may be viewed by system administrators and software developers for the purpose of troubleshooting and issue resolution. All PII is safeguarded as per the NIST.SP.800-53r4 and FalconNet Privacy Policy (March 3, 2021).
For questions or comments about this notice, contact FalconNet@afacademy.af.edu."""
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}