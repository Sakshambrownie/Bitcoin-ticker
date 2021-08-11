import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const APIkey = '37A3D891-EF55-4103-B343-478BEAE05055';

//const bitcoinAverageURL =
//'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$APIkey';

    http.Response response = await http.get(Uri.parse(requestURL));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      var lastRate = decodedData['rate'];

      return lastRate;
    } else {
      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }
}
