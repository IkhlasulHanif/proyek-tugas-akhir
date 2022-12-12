import 'package:flutter/material.dart';
import 'package:proyek_tugas_akhir/konsultasi-user/page/konsultasi_summary.dart';
import 'package:proyek_tugas_akhir/report_user/page/report_summary.dart';
import 'package:proyek_tugas_akhir/user/page/user_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('User Page'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserPage(
                          title: '',
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Report Summary'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ReportSummary()),
              );
            },
          ),
          ListTile(
            title: const Text('Consultation Summary'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const KonsultasiSummary()),
              );
            },
          ),
        ],
      ),
    );
  }
}
