// GENERATED CODE - DO NOT MODIFY BY HAND

part of branch;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(
    latitude: (json['Latitud'] as num)?.toDouble(),
    longitude: (json['Longitud'] as num)?.toDouble(),
    name: json['Nombre'] as String,
    id: json['SucursalID'] as int,
    accountId: json['CuentaId'] as int,
    image: json['Imagen'] as String,
    address: json['Direccion'] as String,
    fbLink: json['LinkFacebook'] as String,
    status: json['Estado'] as String,
    userDown: json['UsuarioBaja'] as int,
    dateDown: json['FechaBaja'] == null
        ? null
        : DateTime.parse(json['FechaBaja'] as String),
    startDate: json['FechaInicio'] == null
        ? null
        : DateTime.parse(json['FechaInicio'] as String),
    endDate: json['FechaFinal'] == null
        ? null
        : DateTime.parse(json['FechaFinal'] as String),
    update: json['Actualizar'] as bool,
    reprocess: json['Reprocesar'] as bool,
    timeCutSend: json['HoraEnvioCorte'] == null
        ? null
        : DateTime.parse(json['HoraEnvioCorte'] as String),
    minimumAmount: (json['ImporteMinimoNot'] as num)?.toDouble(),
    point: json['Punto'] as String,
    openCloseNotify: json['NotificaAperturaYCierre'] as bool,
    type: json['Tipo'] as String,
    lastUpdate: json['ultimaActualizacion'] == null
        ? null
        : DateTime.parse(json['ultimaActualizacion'] as String),
  );
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'Latitud': instance.latitude,
      'Longitud': instance.longitude,
      'Nombre': instance.name,
      'SucursalID': instance.id,
      'CuentaId': instance.accountId,
      'Imagen': instance.image,
      'Direccion': instance.address,
      'LinkFacebook': instance.fbLink,
      'Estado': instance.status,
      'UsuarioBaja': instance.userDown,
      'FechaBaja': instance.dateDown?.toIso8601String(),
      'FechaInicio': instance.startDate?.toIso8601String(),
      'FechaFinal': instance.endDate?.toIso8601String(),
      'Actualizar': instance.update,
      'Reprocesar': instance.reprocess,
      'HoraEnvioCorte': instance.timeCutSend?.toIso8601String(),
      'ImporteMinimoNot': instance.minimumAmount,
      'Punto': instance.point,
      'NotificaAperturaYCierre': instance.openCloseNotify,
      'Tipo': instance.type,
      'ultimaActualizacion': instance.lastUpdate?.toIso8601String(),
    };
