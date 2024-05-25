import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/view/future_template_view.dart';

class ProjectDetailView extends StatelessWidget {
  final int projectId;
  const ProjectDetailView({required this.projectId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectDetailViewModel>(
      viewModel: ProjectDetailViewModel(),
      onModelReady: (model) {
        model.projectId = projectId;
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ProjectDetailViewModel value) =>
          Scaffold(
        body: FutureTemplateView(),
      ),
    );
  }
}
