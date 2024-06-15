import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/project/template/virtual_tour_template/view_model/virtual_tour_template_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualTourTemplateView extends StatefulWidget {
  final int projectDetailId;
  final int projectSettingsId;
  const VirtualTourTemplateView(
      {required this.projectDetailId,
      required this.projectSettingsId,
      super.key});

  @override
  State<VirtualTourTemplateView> createState() =>
      _VirtualTourTemplateViewState();
}

class _VirtualTourTemplateViewState extends State<VirtualTourTemplateView> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<VirtualTourTemplateViewModel>(
      viewModel: VirtualTourTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectDetailId = widget.projectDetailId;
        model.projectSettingsId = widget.projectSettingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, VirtualTourTemplateViewModel value) =>
              Scaffold(
        body: Observer(builder: (context) {
          if (value.template == null) {
            return const SizedBox.shrink();
          }

          controller.loadRequest(Uri.parse(value.template!.url));
          return SafeArea(child: WebViewWidget(controller: controller));
        }),
      ),
    );
  }
}
