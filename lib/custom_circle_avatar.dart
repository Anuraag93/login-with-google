import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double radius;
  final String initial;
  final bool cache;
  final File file;
  final VoidCallback errorListener;

  CustomCircleAvatar(
      {this.imageUrl,
      this.name,
      this.radius,
      this.cache = true,
      this.errorListener})
      : initial = isBlank(name) ? "A" : name.substring(0, 1).toUpperCase(),
        file = null;
  CustomCircleAvatar.file({@required this.file, this.radius})
      : assert(file != null),
        cache = false,
        errorListener = null,
        initial = "A",
        name = null,
        imageUrl = null;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    if (!cache) {
      imageCache.clear();
    }
    Widget initialNameAvatar() => CircleAvatar(
          backgroundColor: _theme.primaryColor,
          child: Text(
            initial,
            style: _theme.textTheme.subhead.copyWith(color: Colors.white),
          ),
          radius: this.radius,
        );

    Widget getImageViaUrl() {
      try {
        return CircleAvatar(
          backgroundColor: _theme.primaryColor,
          backgroundImage: cache
              ? CachedNetworkImageProvider(
                  imageUrl,
                  errorListener: errorListener,
                )
              : NetworkImage(imageUrl),
          radius: this.radius,
        );
      } catch (e) {
        //TODO: handle binsocket_patch error
        return initialNameAvatar();
      }
    }

    Widget getImageViaFile() => CircleAvatar(
          backgroundColor: _theme.primaryColor,
          backgroundImage: FileImage(file),
          radius: this.radius,
        );

    return file != null
        ? getImageViaFile()
        : isBlank(imageUrl) ? initialNameAvatar() : getImageViaUrl();
  }
}
