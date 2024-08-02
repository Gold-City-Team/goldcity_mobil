import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/template/virtual_tour_template/view_model/virtual_tour_template_view_model.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class VirtualTourTemplateView extends StatefulWidget {
  final int projectSettingsId;
  const VirtualTourTemplateView({required this.projectSettingsId, super.key});

  @override
  State<VirtualTourTemplateView> createState() =>
      _VirtualTourTemplateViewState();
}

class _VirtualTourTemplateViewState extends State<VirtualTourTemplateView> {
  late WebViewXController webviewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<VirtualTourTemplateViewModel>(
      viewModel: VirtualTourTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
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

          return SafeArea(
            child: WebViewX(
              width: context.sWidth,
              height: context.sHeight,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                webviewController = controller;
                webviewController.loadContent(value.template!.url);
              },
            ),
          );
        }),
      ),
    );
  }
}
