import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmartDrawer extends StatelessWidget {
  final double elevation;
  final Widget? child; //设置展示内容
  final String semanticLabel;

  final double widthPercent; // 设置宽度比例

  const SmartDrawer({
    Key? key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel = "default",
    this.widthPercent = 0.7, // 默认比例
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));

    String? label = semanticLabel;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        // label = semanticLabel ?? MaterialLocalizations.of(context)?.drawerLabel;
        label = semanticLabel;
        break;
      default:
        throw UnimplementedError('no widget for $label');
    }

    ///获取宽度
    final double _width = MediaQuery.of(context).size.width * widthPercent;

    ///new end
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        ///edit start
        constraints: BoxConstraints.expand(width: _width),

        ///edit end
        child: Material(
          elevation: elevation,
          child: child,
        ),
      ),
    );
  }
}
