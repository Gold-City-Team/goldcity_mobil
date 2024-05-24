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
          const Scaffold(
        body: FutureTemplateView(),
        // body: SafeArea(

        //   child: ListView(
        //     children: [
        //       Observer(builder: (context) {
        //         if (value.projectEntity == null) {
        //           return const SizedBox.shrink();
        //         }
        //         return ProjectDetailBannerWidget(
        //           projectEntity: value.projectEntity!,
        //         );
        //       }),
        //       Gap(context.midSpacerSize),
        //       Observer(builder: (context) {
        //         if (value.projectEntity == null) {
        //           return const SizedBox.shrink();
        //         }
        //         return Wrap(
        //           children: value.projectEntity!.detail.features
        //               .map((e) => FeaturesWidget(featuresEntity: e))
        //               .toList(),
        //         );
        //       }),
        //       Gap(context.midSpacerSize),
        //       Observer(builder: (context) {
        //         if (value.projectEntity == null) {
        //           return const SizedBox.shrink();
        //         }
        //         return Center(
        //           child: Wrap(
        //             children: value.projectEntity!.detail.buttons
        //                 .map((e) => GestureDetector(
        //                     onTap: () => value.projectButtonClick(e.type),
        //                     child: ButtonWidget(text: e.title)))
        //                 .toList(),
        //           ),
        //         );
        //       }),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
