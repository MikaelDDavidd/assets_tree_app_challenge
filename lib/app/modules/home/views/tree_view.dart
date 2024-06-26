import 'package:assets_tree_app_challenge/app/data/models/model.dart';
import 'package:assets_tree_app_challenge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreeView extends StatefulWidget {
  final String companyId;

  TreeView({Key? key, required this.companyId}) : super(key: key);

  @override
  _TreeViewState createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  final HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchLocations(widget.companyId);
      controller.fetchAssets(widget.companyId);
    });
  }

  List<Widget> buildAssetTree(Asset asset) {
    List<Widget> children = [];

    // Adicionando subativos e componentes
    var subAssets = controller.assets.where((subAsset) => subAsset.parentId == asset.id).toList();
    for (var subAsset in subAssets) {
      children.add(
        ExpansionTile(
          title: Text(subAsset.name),
          children: buildAssetTree(subAsset),
        ),
      );
    }

    var components = controller.assets.where((component) => component.parentId == asset.id && component.sensorType != null).toList();
    for (var component in components) {
      children.add(
        ListTile(
          title: Text(component.name),
          subtitle: Text(component.sensorType ?? ''),
        ),
      );
    }

    return children;
  }

  List<Widget> buildLocationTree(Location location) {
    List<Widget> children = [];

    // Adicionando sublocais
    var subLocations = controller.locations.where((subLoc) => subLoc.parentId == location.id).toList();
    for (var subLoc in subLocations) {
      children.add(
        ExpansionTile(
          title: Text(subLoc.name),
          children: buildLocationTree(subLoc),
        ),
      );
    }

    // Adicionando ativos
    var assets = controller.assets.where((asset) => asset.locationId == location.id && asset.parentId == null).toList();
    for (var asset in assets) {
      children.add(
        ExpansionTile(
          title: Text(asset.name),
          children: buildAssetTree(asset),
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Assets'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return ListView(
            children: [
              for (var location in controller.locations.where((loc) => loc.parentId == null))
                ExpansionTile(
                  title: Text(location.name),
                  children: buildLocationTree(location),
                ),
            ],
          );
        }
      }),
    );
  }
}
