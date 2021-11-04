import 'package:equatable/equatable.dart';

abstract class UseCase<DataType, Params> {
  Future<DataType> call(Params params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
