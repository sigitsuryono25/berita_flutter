import 'package:http/http.dart' as http;
const baseUrl = "http://www.lauwba.com/webservices/";
class Api{
  static Future getNews(){
    var url = baseUrl + "get_latest_news";
    return http.get(url);
  }

  static Future getDetailNews(String idNews){
    var url = baseUrl + "get_detail_news/$idNews";
    return http.get(url);
  }

}