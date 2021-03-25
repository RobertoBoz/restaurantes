import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart' show required;
import 'package:restaurantes/App/Data/Models/Category.dart';
import 'package:restaurantes/App/Data/Models/Restaurant.dart';

import 'package:restaurantes/App/Data/Providers/Remote/CategoriRemoteService.dart';

class RepositoryServiceApi {

  final RepositoryService _api;

  RepositoryServiceApi(this._api);

  Future <List<Cat>> categoriRepositori() => _api.categoriService();

  Future<List<Restaurantes>> restaurantRepositori() => _api.restaurantRepositoriGet();

  createNewRestaurant({@required String name, @required String detail, @required PickedFile image ,@required List<String> category  }) => _api.createNewRestaurantService(name: name, detail: detail, image: image , category: category);

  createRepositoriNewReview({@required String name, @required String email, @required String raiting,@required String coment  } ) => _api.createNewReviwtService(name: name, email: email, raiting: raiting, coment: coment);


}