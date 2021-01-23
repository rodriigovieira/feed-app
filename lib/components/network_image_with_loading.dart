import 'package:flutter/material.dart';
import 'package:joyjet_test/components/custom_loading_indicator.dart';

class NetworkImageWithLoading extends StatelessWidget {
  final String imageUrl;

  const NetworkImageWithLoading({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      frameBuilder: (
        BuildContext context,
        Widget child,
        int frame,
        bool wasSynchronouslyLoaded,
      ) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }

        return CustomLoadingIndicator();
      },
    );
  }
}
