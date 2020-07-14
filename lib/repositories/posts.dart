import 'package:notas_fiscales/models/post_detail.dart';
import 'package:notas_fiscales/providers/api.dart';
import 'package:notas_fiscales/constants.dart';
import 'package:notas_fiscales/models/models.dart';

class PostsRepository {
  final provider = new ApiProvider(Constants.backendServer);

  Future<List<Post>> getPosts() async {
    List<Post> response = await this.provider.news();
    return response;
  }

  Future<PostDetail> getPostDetail(int id) async {
    PostDetail response = await this.provider.post(id);
    return response;
  }
}
