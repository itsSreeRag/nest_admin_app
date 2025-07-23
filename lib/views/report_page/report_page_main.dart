import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nest_admin_app/controllers/report_bloc/report_bloc.dart';
import 'package:nest_admin_app/controllers/report_bloc/report_state.dart';
import 'package:nest_admin_app/views/report_details/report_detail_page_main.dart';
import 'package:nest_admin_app/views/report_page/report_list_title.dart';
import 'package:nest_admin_app/widgets/custom_page_heading.dart';

class ReportListPage extends StatelessWidget {
  const ReportListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomPageHeding(
            icon: Icons.report,
            title: 'User Reports',
            subTitle: 'View and manage reports submitted by users',
          ),
          Expanded(
            child: BlocBuilder<ReportBloc, ReportState>(
              builder: (context, state) {
                if (state is ReportLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ReportLoaded) {
                  if (state.reports.isEmpty) {
                    return const Center(child: Text("No reports found."));
                  }
                  return ListView.builder(
                    itemCount: state.reports.length,
                    itemBuilder: (context, index) {
                      final report = state.reports[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportDetailsPage(reportData: report,),
                            ),
                          );
                        },
                        child: ReportListTile(report: report),
                      );
                    },
                  );
                } else if (state is ReportError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
