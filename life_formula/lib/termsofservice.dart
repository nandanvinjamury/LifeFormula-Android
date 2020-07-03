import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TermsPage extends StatelessWidget {

  String termsText = """
1. Terms
By accessing our app, Life Formula, you are agreeing to be bound by these terms of service, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing Life Formula. The materials contained in Life Formula are protected by applicable copyright and trademark law.



2. Use License
Permission is granted to temporarily download one copy of Life Formula per device for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:

i. modify or copy the materials;

ii. use the materials for any commercial purpose, or for any public display (commercial or non-commercial);

iii. attempt to decompile or reverse engineer any software contained in Life Formula;

iv. remove any copyright or other proprietary notations from the materials; or

v. transfer the materials to another person or "mirror" the materials on any other server.

This license shall automatically terminate if you violate any of these restrictions and may be terminated by Life Formula at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.



3. Disclaimer
The materials within Life Formula are provided on an 'as is' basis. Life Formula makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including, without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.
Further, Life Formula does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its website or otherwise relating to such materials or on any sites linked to Life Formula.



4. Limitations
In no event shall Life Formula or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use Life Formula, even if Life Formula or a Life Formula authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.



5. Accuracy of materials
The materials appearing in Life Formula could include technical, typographical, or photographic errors. Life Formula does not warrant that any of the materials on Life Formula are accurate, complete or current. Life Formula may make changes to the materials contained in Life Formula at any time without notice. However Life Formula does not make any commitment to update the materials.



6. Links
Life Formula has not reviewed all of the sites linked to its app and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Life Formula of the site. Use of any such linked website is at the user's own risk.



7. Modifications
Life Formula may revise these terms of service for its app at any time without notice. By using Life Formula you are agreeing to be bound by the then current version of these terms of service.



8. Governing Law
These terms and conditions are governed by and construed in accordance with the laws of California and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.



Terms of Use created with GetTerms.
""";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    "LIFE FORMULA TERMS OF SERVICE",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        termsText,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
