import 'package:fpdart/fpdart.dart';
import 'package:equatable/equatable.dart';
import '../failures/failure.dart';

/// A classe abstrata para todos os UseCases na aplicação.
/// DataType: O tipo de dado que será retornado em caso de sucesso.
/// Params: O tipo de parâmetros necessários para executar o use case.
abstract class UseCase<DataType, Params> {
  Future<Either<Failure, DataType>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
