import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<GalleryViewModel>(
      viewModel: GalleryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GalleryViewModel value) {
        return Scaffold(
          body: Observer(
            builder: (context) {
              if (value.projectGallery == null) {
                return const SizedBox.shrink();
              }
              return Center(
                child: NormalNetworkImage(
                    fit: BoxFit.contain,
                    source:
                        value.projectGallery!.projectGallery.first.media.url),
              );
            },
          ),
        );
      },
    );
  }
}
