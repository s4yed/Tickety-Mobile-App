class Constants {
  static const String baseURI = 'http://10.0.2.2:5000';
  static const String API = baseURI + '/api';
  static const String images = baseURI + '/images/users';
  static const String auth = API + '/auth';
  static const String login = auth + '/login';
  static const String signup = auth + '/signup';
  static const String tickets = API + '/tickets';
  static const String matches = tickets + '/matches';
  static const String trains = tickets + '/trains';
  static const String buses = tickets + '/buses';
  static const String cinemas = tickets + '/cinemas';
  static const String users = API + '/users';
  static const String userData = users + '/user_data';
  static const String addTicket = users + '/add_ticket';
  static const String removeTicket = users + '/remove_ticket';
  static Function headers = (token) {
    return {
      'jsonHeader': {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer $token'
      },
      'fileHeader': {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token'
      }
    };
  };
}