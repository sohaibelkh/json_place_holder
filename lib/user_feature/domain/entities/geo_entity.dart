import 'package:equatable/equatable.dart';

class Geo extends Equatable{
  final dynamic lat;
  final dynamic lng;

 const Geo({required this.lat,required this.lng});
  
  @override
  List<Object?> get props =>[lat, lng];

  @override
  bool? get stringify => true;
}