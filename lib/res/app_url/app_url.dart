class AppUrl {
  // static const url='https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/rajkot?unitGroup=metric&key=7JWQMV9WC5JJBUQF22L83ERCB&contentType=json';
  static urlWeather({address}) =>
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$address?unitGroup=metric&key=7JWQMV9WC5JJBUQF22L83ERCB&contentType=json';
  // static urlWeather({lat, lng}) =>
  //     'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$lat,$lng?unitGroup=metric&key=7JWQMV9WC5JJBUQF22L83ERCB&contentType=json';

  // static const url='https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/20.8009,70.6960?unitGroup=metric&key=7JWQMV9WC5JJBUQF22L83ERCB&contentType=json';
}
