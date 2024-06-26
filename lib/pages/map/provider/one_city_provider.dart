import 'package:flutter/cupertino.dart';
import 'package:air_puff/pages/map/model/air_model_entity.dart';
import 'package:air_puff/pages/map/model/air_quality_entity.dart';
import 'package:sp_util/sp_util.dart';

class OneCityProvider extends ChangeNotifier {
  AirModelEntity? airModel;

  TextEditingController cityNameController = TextEditingController();

  void setAirQualityEntity(AirQualityEntity model) {
    airModel = model.data;
    cityNameController.text = airModel?.city?.name ?? '';

    if (airModel != null) {
      SpUtil.putObject('airModel', airModel!);
    }

    notifyListeners();
  }
}
