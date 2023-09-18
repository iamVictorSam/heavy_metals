import 'package:get/get.dart';
import 'package:heavy_metals/models/model.dart';
import 'package:heavy_metals/network/api_call.dart';

class HomeController extends GetxController {
  var metals = <MetalsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMetals();
  }

  void fetchMetals() async {
    isLoading(true);
    try {
      var metalResult = await NetworkCall().fetchMetalsData();
      metals.value = metalResult;
    } finally {
      isLoading(false);
      update();
    }
  }
}
