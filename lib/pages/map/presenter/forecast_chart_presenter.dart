import 'dart:convert';

import 'package:oktoast/oktoast.dart';
import 'package:air_puff/mvp/base_page_presenter.dart';
import 'package:air_puff/pages/map/iviews/forecast_chart_iviews.dart';
import 'package:http/http.dart' as http;
import 'package:air_puff/pages/map/model/air_quality_entity.dart';

class ForecastChartPresenter extends BasePagePresenter<ForecastChartIMvpView> {
  Future<dynamic> getCityAirQualityData(
    String cityName,
  ) async {
    Uri u = Uri.http('api.waqi.info', '/feed/$cityName', {
      "token": "a86e6a2502c20979c108bbd3b957fc06cced853b",
    });
    final response = await http.get(u);
    if (response.statusCode == 200) {
      if (json.decode(response.body)['status'] == 'error') {
        return showToast('The city was not found');
      }
      AirQualityEntity model =
          AirQualityEntity.fromJson(json.decode(response.body));
      view.provider.refreshData(model);
    } else {
      throw Exception('Failed to fetch access token: ${response.reasonPhrase}');
    }
  }
}
