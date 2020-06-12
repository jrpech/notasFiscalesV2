library branch;

import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {
  @JsonKey(name: "Latitud")
  double latitude;
  @JsonKey(name: "Longitud")
  double longitude;
  @JsonKey(name: "Nombre")
  String name;
  @JsonKey(name: "SucursalID")
  int id;
  @JsonKey(name: "CuentaId")
  int accountId;
  @JsonKey(name: "Imagen")
  String image;
  @JsonKey(name: "Direccion")
  String address;
  @JsonKey(name: "LinkFacebook")
  String fbLink;
  @JsonKey(name: "Estado")
  String status;
  @JsonKey(name: "UsuarioBaja")
  int userDown;
  @JsonKey(name: "FechaBaja")
  DateTime dateDown;
  @JsonKey(name: "FechaInicio")
  DateTime startDate;
  @JsonKey(name: "FechaFinal")
  DateTime endDate;
  @JsonKey(name: "Actualizar")
  bool update;
  @JsonKey(name: "Reprocesar")
  bool reprocess;
  @JsonKey(name: "HoraEnvioCorte")
  DateTime timeCutSend;
  @JsonKey(name: "ImporteMinimoNot")
  double minimumAmount;
  @JsonKey(name: "Punto")
  String point;
  @JsonKey(name: "NotificaAperturaYCierre")
  bool openCloseNotify;
  @JsonKey(name: "Tipo")
  String type;
  @JsonKey(name: "ultimaActualizacion")
  DateTime lastUpdate;

  Branch(
      {this.latitude,
      this.longitude,
      this.name,
      this.id,
      this.accountId,
      this.image,
      this.address,
      this.fbLink,
      this.status,
      this.userDown,
      this.dateDown,
      this.startDate,
      this.endDate,
      this.update,
      this.reprocess,
      this.timeCutSend,
      this.minimumAmount,
      this.point,
      this.openCloseNotify,
      this.type,
      this.lastUpdate});

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
