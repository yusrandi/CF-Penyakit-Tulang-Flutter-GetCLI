import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli_cf_flutter/app/cores/core_colors.dart';

import '../../diagnosa/controllers/diagnosa_controller.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  final ResultController resultController = Get.put(ResultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.whiteSoft,
      appBar: AppBar(
        title: Text('ResultView'),
        centerTitle: false,
        backgroundColor: CoreColor.primary,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Obx(() => Text(resultController.resultText.value)),
            ),
            Obx(
              () => resultController.dataListResult != null
                  ? listResultPenyakit(resultController.dataListResult)
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  listResultPenyakit(List<ResultModel> list) {
    list.sort((a, b) => b.value.compareTo(a.value));
    return ListView.separated(
      // crossAxisCount is the number of columns
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        ResultModel model = list[index];
        return Text(
            "id : ${model.penyakit!.penyakitNama.toString()}, value : ${model.value}");
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
    );
  }

  listResult(List<DiagnosaModel> list) {
    return ListView.separated(
      // crossAxisCount is the number of columns
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        DiagnosaModel model = list[index];
        return Text(
            "id : ${model.id.toString()}, value : ${model.value * model.id}");
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 16,
      ),
    );
  }
}
