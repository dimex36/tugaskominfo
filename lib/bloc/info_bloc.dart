import 'dart:async';

import '../model/info_model.dart';
import '../service/info_service.dart';
import '../source/network_source.dart';
import '../utils/wrapper.dart';


class InfoBloc {
  final _stream = StreamController<InfoModel>(); // controller, emit here
  Stream<InfoModel> get stream => _stream.stream; // will represent the stream

  Future<void> getInfo() async {
    Wrapper<InfoModel>().wrapBloc(
      _stream,
      () async {
        return await InfoService(NetworkSource.dio()).getInfo();
      },
    );
  }
}
