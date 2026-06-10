// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot_instance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRobotInstanceCollection on Isar {
  IsarCollection<RobotInstance> get robotInstances => this.collection();
}

const RobotInstanceSchema = CollectionSchema(
  name: r'RobotInstance',
  id: -8439040005685922664,
  properties: {
    r'abilities': PropertySchema(
      id: 0,
      name: r'abilities',
      type: IsarType.stringList,
    ),
    r'battery': PropertySchema(
      id: 1,
      name: r'battery',
      type: IsarType.object,
      target: r'CareStatData',
    ),
    r'combat': PropertySchema(
      id: 2,
      name: r'combat',
      type: IsarType.object,
      target: r'CombatStatsData',
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'entertainment': PropertySchema(
      id: 4,
      name: r'entertainment',
      type: IsarType.object,
      target: r'CareStatData',
    ),
    r'instanceId': PropertySchema(
      id: 5,
      name: r'instanceId',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 6,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isFavorite': PropertySchema(
      id: 7,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'lastFedAt': PropertySchema(
      id: 8,
      name: r'lastFedAt',
      type: IsarType.dateTime,
    ),
    r'lastTickAt': PropertySchema(
      id: 9,
      name: r'lastTickAt',
      type: IsarType.dateTime,
    ),
    r'level': PropertySchema(
      id: 10,
      name: r'level',
      type: IsarType.long,
    ),
    r'loadout': PropertySchema(
      id: 11,
      name: r'loadout',
      type: IsarType.object,
      target: r'Loadout',
    ),
    r'neglectStrikes': PropertySchema(
      id: 12,
      name: r'neglectStrikes',
      type: IsarType.long,
    ),
    r'nickname': PropertySchema(
      id: 13,
      name: r'nickname',
      type: IsarType.string,
    ),
    r'oil': PropertySchema(
      id: 14,
      name: r'oil',
      type: IsarType.object,
      target: r'CareStatData',
    ),
    r'rarity': PropertySchema(
      id: 15,
      name: r'rarity',
      type: IsarType.string,
      enumMap: _RobotInstancerarityEnumValueMap,
    ),
    r'robotClass': PropertySchema(
      id: 16,
      name: r'robotClass',
      type: IsarType.string,
      enumMap: _RobotInstancerobotClassEnumValueMap,
    ),
    r'schemaVersion': PropertySchema(
      id: 17,
      name: r'schemaVersion',
      type: IsarType.long,
    ),
    r'scrapPerSecond': PropertySchema(
      id: 18,
      name: r'scrapPerSecond',
      type: IsarType.double,
    ),
    r'speciesId': PropertySchema(
      id: 19,
      name: r'speciesId',
      type: IsarType.string,
    ),
    r'xp': PropertySchema(
      id: 20,
      name: r'xp',
      type: IsarType.long,
    ),
    r'xpToNext': PropertySchema(
      id: 21,
      name: r'xpToNext',
      type: IsarType.long,
    )
  },
  estimateSize: _robotInstanceEstimateSize,
  serialize: _robotInstanceSerialize,
  deserialize: _robotInstanceDeserialize,
  deserializeProp: _robotInstanceDeserializeProp,
  idName: r'id',
  indexes: {
    r'instanceId': IndexSchema(
      id: -6720444513014720235,
      name: r'instanceId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'instanceId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'isActive': IndexSchema(
      id: 8092228061260947457,
      name: r'isActive',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isActive',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'CareStatData': CareStatDataSchema,
    r'CombatStatsData': CombatStatsDataSchema,
    r'Loadout': LoadoutSchema
  },
  getId: _robotInstanceGetId,
  getLinks: _robotInstanceGetLinks,
  attach: _robotInstanceAttach,
  version: '3.1.0+1',
);

int _robotInstanceEstimateSize(
  RobotInstance object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.abilities.length * 3;
  {
    for (var i = 0; i < object.abilities.length; i++) {
      final value = object.abilities[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 +
      CareStatDataSchema.estimateSize(
          object.battery, allOffsets[CareStatData]!, allOffsets);
  bytesCount += 3 +
      CombatStatsDataSchema.estimateSize(
          object.combat, allOffsets[CombatStatsData]!, allOffsets);
  bytesCount += 3 +
      CareStatDataSchema.estimateSize(
          object.entertainment, allOffsets[CareStatData]!, allOffsets);
  bytesCount += 3 + object.instanceId.length * 3;
  bytesCount += 3 +
      LoadoutSchema.estimateSize(
          object.loadout, allOffsets[Loadout]!, allOffsets);
  bytesCount += 3 + object.nickname.length * 3;
  bytesCount += 3 +
      CareStatDataSchema.estimateSize(
          object.oil, allOffsets[CareStatData]!, allOffsets);
  bytesCount += 3 + object.rarity.name.length * 3;
  bytesCount += 3 + object.robotClass.name.length * 3;
  bytesCount += 3 + object.speciesId.length * 3;
  return bytesCount;
}

void _robotInstanceSerialize(
  RobotInstance object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.abilities);
  writer.writeObject<CareStatData>(
    offsets[1],
    allOffsets,
    CareStatDataSchema.serialize,
    object.battery,
  );
  writer.writeObject<CombatStatsData>(
    offsets[2],
    allOffsets,
    CombatStatsDataSchema.serialize,
    object.combat,
  );
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeObject<CareStatData>(
    offsets[4],
    allOffsets,
    CareStatDataSchema.serialize,
    object.entertainment,
  );
  writer.writeString(offsets[5], object.instanceId);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeBool(offsets[7], object.isFavorite);
  writer.writeDateTime(offsets[8], object.lastFedAt);
  writer.writeDateTime(offsets[9], object.lastTickAt);
  writer.writeLong(offsets[10], object.level);
  writer.writeObject<Loadout>(
    offsets[11],
    allOffsets,
    LoadoutSchema.serialize,
    object.loadout,
  );
  writer.writeLong(offsets[12], object.neglectStrikes);
  writer.writeString(offsets[13], object.nickname);
  writer.writeObject<CareStatData>(
    offsets[14],
    allOffsets,
    CareStatDataSchema.serialize,
    object.oil,
  );
  writer.writeString(offsets[15], object.rarity.name);
  writer.writeString(offsets[16], object.robotClass.name);
  writer.writeLong(offsets[17], object.schemaVersion);
  writer.writeDouble(offsets[18], object.scrapPerSecond);
  writer.writeString(offsets[19], object.speciesId);
  writer.writeLong(offsets[20], object.xp);
  writer.writeLong(offsets[21], object.xpToNext);
}

RobotInstance _robotInstanceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RobotInstance();
  object.abilities = reader.readStringList(offsets[0]) ?? [];
  object.battery = reader.readObjectOrNull<CareStatData>(
        offsets[1],
        CareStatDataSchema.deserialize,
        allOffsets,
      ) ??
      CareStatData();
  object.combat = reader.readObjectOrNull<CombatStatsData>(
        offsets[2],
        CombatStatsDataSchema.deserialize,
        allOffsets,
      ) ??
      CombatStatsData();
  object.createdAt = reader.readDateTime(offsets[3]);
  object.entertainment = reader.readObjectOrNull<CareStatData>(
        offsets[4],
        CareStatDataSchema.deserialize,
        allOffsets,
      ) ??
      CareStatData();
  object.id = id;
  object.instanceId = reader.readString(offsets[5]);
  object.isActive = reader.readBool(offsets[6]);
  object.isFavorite = reader.readBool(offsets[7]);
  object.lastFedAt = reader.readDateTimeOrNull(offsets[8]);
  object.lastTickAt = reader.readDateTime(offsets[9]);
  object.level = reader.readLong(offsets[10]);
  object.loadout = reader.readObjectOrNull<Loadout>(
        offsets[11],
        LoadoutSchema.deserialize,
        allOffsets,
      ) ??
      Loadout();
  object.neglectStrikes = reader.readLong(offsets[12]);
  object.nickname = reader.readString(offsets[13]);
  object.oil = reader.readObjectOrNull<CareStatData>(
        offsets[14],
        CareStatDataSchema.deserialize,
        allOffsets,
      ) ??
      CareStatData();
  object.rarity =
      _RobotInstancerarityValueEnumMap[reader.readStringOrNull(offsets[15])] ??
          Rarity.common;
  object.robotClass = _RobotInstancerobotClassValueEnumMap[
          reader.readStringOrNull(offsets[16])] ??
      RobotClass.scout;
  object.schemaVersion = reader.readLong(offsets[17]);
  object.scrapPerSecond = reader.readDouble(offsets[18]);
  object.speciesId = reader.readString(offsets[19]);
  object.xp = reader.readLong(offsets[20]);
  object.xpToNext = reader.readLong(offsets[21]);
  return object;
}

P _robotInstanceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readObjectOrNull<CareStatData>(
            offset,
            CareStatDataSchema.deserialize,
            allOffsets,
          ) ??
          CareStatData()) as P;
    case 2:
      return (reader.readObjectOrNull<CombatStatsData>(
            offset,
            CombatStatsDataSchema.deserialize,
            allOffsets,
          ) ??
          CombatStatsData()) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<CareStatData>(
            offset,
            CareStatDataSchema.deserialize,
            allOffsets,
          ) ??
          CareStatData()) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readObjectOrNull<Loadout>(
            offset,
            LoadoutSchema.deserialize,
            allOffsets,
          ) ??
          Loadout()) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readObjectOrNull<CareStatData>(
            offset,
            CareStatDataSchema.deserialize,
            allOffsets,
          ) ??
          CareStatData()) as P;
    case 15:
      return (_RobotInstancerarityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          Rarity.common) as P;
    case 16:
      return (_RobotInstancerobotClassValueEnumMap[
              reader.readStringOrNull(offset)] ??
          RobotClass.scout) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RobotInstancerarityEnumValueMap = {
  r'common': r'common',
  r'rare': r'rare',
  r'epic': r'epic',
  r'legendary': r'legendary',
};
const _RobotInstancerarityValueEnumMap = {
  r'common': Rarity.common,
  r'rare': Rarity.rare,
  r'epic': Rarity.epic,
  r'legendary': Rarity.legendary,
};
const _RobotInstancerobotClassEnumValueMap = {
  r'scout': r'scout',
  r'tank': r'tank',
  r'brawler': r'brawler',
  r'support': r'support',
};
const _RobotInstancerobotClassValueEnumMap = {
  r'scout': RobotClass.scout,
  r'tank': RobotClass.tank,
  r'brawler': RobotClass.brawler,
  r'support': RobotClass.support,
};

Id _robotInstanceGetId(RobotInstance object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _robotInstanceGetLinks(RobotInstance object) {
  return [];
}

void _robotInstanceAttach(
    IsarCollection<dynamic> col, Id id, RobotInstance object) {
  object.id = id;
}

extension RobotInstanceByIndex on IsarCollection<RobotInstance> {
  Future<RobotInstance?> getByInstanceId(String instanceId) {
    return getByIndex(r'instanceId', [instanceId]);
  }

  RobotInstance? getByInstanceIdSync(String instanceId) {
    return getByIndexSync(r'instanceId', [instanceId]);
  }

  Future<bool> deleteByInstanceId(String instanceId) {
    return deleteByIndex(r'instanceId', [instanceId]);
  }

  bool deleteByInstanceIdSync(String instanceId) {
    return deleteByIndexSync(r'instanceId', [instanceId]);
  }

  Future<List<RobotInstance?>> getAllByInstanceId(
      List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'instanceId', values);
  }

  List<RobotInstance?> getAllByInstanceIdSync(List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'instanceId', values);
  }

  Future<int> deleteAllByInstanceId(List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'instanceId', values);
  }

  int deleteAllByInstanceIdSync(List<String> instanceIdValues) {
    final values = instanceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'instanceId', values);
  }

  Future<Id> putByInstanceId(RobotInstance object) {
    return putByIndex(r'instanceId', object);
  }

  Id putByInstanceIdSync(RobotInstance object, {bool saveLinks = true}) {
    return putByIndexSync(r'instanceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInstanceId(List<RobotInstance> objects) {
    return putAllByIndex(r'instanceId', objects);
  }

  List<Id> putAllByInstanceIdSync(List<RobotInstance> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'instanceId', objects, saveLinks: saveLinks);
  }
}

extension RobotInstanceQueryWhereSort
    on QueryBuilder<RobotInstance, RobotInstance, QWhere> {
  QueryBuilder<RobotInstance, RobotInstance, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhere> anyIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isActive'),
      );
    });
  }
}

extension RobotInstanceQueryWhere
    on QueryBuilder<RobotInstance, RobotInstance, QWhereClause> {
  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause>
      instanceIdEqualTo(String instanceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'instanceId',
        value: [instanceId],
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause>
      instanceIdNotEqualTo(String instanceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [],
              upper: [instanceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [instanceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [instanceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'instanceId',
              lower: [],
              upper: [instanceId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause> isActiveEqualTo(
      bool isActive) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isActive',
        value: [isActive],
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterWhereClause>
      isActiveNotEqualTo(bool isActive) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActive',
              lower: [],
              upper: [isActive],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActive',
              lower: [isActive],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActive',
              lower: [isActive],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isActive',
              lower: [],
              upper: [isActive],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RobotInstanceQueryFilter
    on QueryBuilder<RobotInstance, RobotInstance, QFilterCondition> {
  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'abilities',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'abilities',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'abilities',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'abilities',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'abilities',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      abilitiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'abilities',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instanceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instanceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instanceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instanceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      instanceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instanceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastFedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastFedAt',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastFedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastFedAt',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastFedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastFedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastFedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastFedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastFedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastFedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastFedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastFedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastTickAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTickAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastTickAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTickAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastTickAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTickAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      lastTickAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTickAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      levelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      levelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      levelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      neglectStrikesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'neglectStrikes',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      neglectStrikesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'neglectStrikes',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      neglectStrikesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'neglectStrikes',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      neglectStrikesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'neglectStrikes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nickname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nickname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickname',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      nicknameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nickname',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityEqualTo(
    Rarity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityGreaterThan(
    Rarity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityLessThan(
    Rarity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityBetween(
    Rarity lower,
    Rarity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rarity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rarity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      rarityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassEqualTo(
    RobotClass value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'robotClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassGreaterThan(
    RobotClass value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'robotClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassLessThan(
    RobotClass value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'robotClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassBetween(
    RobotClass lower,
    RobotClass upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'robotClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'robotClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'robotClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'robotClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'robotClass',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'robotClass',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      robotClassIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'robotClass',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      schemaVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      schemaVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      schemaVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'schemaVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      schemaVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'schemaVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      scrapPerSecondEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scrapPerSecond',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      scrapPerSecondGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scrapPerSecond',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      scrapPerSecondLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scrapPerSecond',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      scrapPerSecondBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scrapPerSecond',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speciesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speciesId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speciesId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speciesId',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      speciesIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speciesId',
        value: '',
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> xpEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xp',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      xpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xp',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> xpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xp',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> xpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      xpToNextEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xpToNext',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      xpToNextGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xpToNext',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      xpToNextLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xpToNext',
        value: value,
      ));
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      xpToNextBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xpToNext',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RobotInstanceQueryObject
    on QueryBuilder<RobotInstance, RobotInstance, QFilterCondition> {
  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> battery(
      FilterQuery<CareStatData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'battery');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> combat(
      FilterQuery<CombatStatsData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'combat');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition>
      entertainment(FilterQuery<CareStatData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'entertainment');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> loadout(
      FilterQuery<Loadout> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'loadout');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterFilterCondition> oil(
      FilterQuery<CareStatData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'oil');
    });
  }
}

extension RobotInstanceQueryLinks
    on QueryBuilder<RobotInstance, RobotInstance, QFilterCondition> {}

extension RobotInstanceQuerySortBy
    on QueryBuilder<RobotInstance, RobotInstance, QSortBy> {
  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByInstanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByInstanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByLastFedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFedAt', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByLastFedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFedAt', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByLastTickAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTickAt', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByLastTickAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTickAt', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByNeglectStrikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neglectStrikes', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByNeglectStrikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neglectStrikes', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByRobotClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotClass', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByRobotClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotClass', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByScrapPerSecond() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrapPerSecond', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByScrapPerSecondDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrapPerSecond', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortBySpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortBySpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> sortByXpToNext() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpToNext', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      sortByXpToNextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpToNext', Sort.desc);
    });
  }
}

extension RobotInstanceQuerySortThenBy
    on QueryBuilder<RobotInstance, RobotInstance, QSortThenBy> {
  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByInstanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByInstanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instanceId', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByLastFedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFedAt', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByLastFedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastFedAt', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByLastTickAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTickAt', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByLastTickAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTickAt', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByNeglectStrikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neglectStrikes', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByNeglectStrikesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'neglectStrikes', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByRobotClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotClass', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByRobotClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'robotClass', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenBySchemaVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'schemaVersion', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByScrapPerSecond() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrapPerSecond', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByScrapPerSecondDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scrapPerSecond', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenBySpeciesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenBySpeciesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speciesId', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByXpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xp', Sort.desc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy> thenByXpToNext() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpToNext', Sort.asc);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QAfterSortBy>
      thenByXpToNextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'xpToNext', Sort.desc);
    });
  }
}

extension RobotInstanceQueryWhereDistinct
    on QueryBuilder<RobotInstance, RobotInstance, QDistinct> {
  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByAbilities() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'abilities');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByInstanceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instanceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByLastFedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastFedAt');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByLastTickAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTickAt');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct>
      distinctByNeglectStrikes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'neglectStrikes');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByNickname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByRarity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rarity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByRobotClass(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'robotClass', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct>
      distinctBySchemaVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'schemaVersion');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct>
      distinctByScrapPerSecond() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scrapPerSecond');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctBySpeciesId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speciesId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByXp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xp');
    });
  }

  QueryBuilder<RobotInstance, RobotInstance, QDistinct> distinctByXpToNext() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'xpToNext');
    });
  }
}

extension RobotInstanceQueryProperty
    on QueryBuilder<RobotInstance, RobotInstance, QQueryProperty> {
  QueryBuilder<RobotInstance, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RobotInstance, List<String>, QQueryOperations>
      abilitiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'abilities');
    });
  }

  QueryBuilder<RobotInstance, CareStatData, QQueryOperations>
      batteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'battery');
    });
  }

  QueryBuilder<RobotInstance, CombatStatsData, QQueryOperations>
      combatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'combat');
    });
  }

  QueryBuilder<RobotInstance, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RobotInstance, CareStatData, QQueryOperations>
      entertainmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entertainment');
    });
  }

  QueryBuilder<RobotInstance, String, QQueryOperations> instanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instanceId');
    });
  }

  QueryBuilder<RobotInstance, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RobotInstance, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<RobotInstance, DateTime?, QQueryOperations> lastFedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastFedAt');
    });
  }

  QueryBuilder<RobotInstance, DateTime, QQueryOperations> lastTickAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTickAt');
    });
  }

  QueryBuilder<RobotInstance, int, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<RobotInstance, Loadout, QQueryOperations> loadoutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loadout');
    });
  }

  QueryBuilder<RobotInstance, int, QQueryOperations> neglectStrikesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'neglectStrikes');
    });
  }

  QueryBuilder<RobotInstance, String, QQueryOperations> nicknameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickname');
    });
  }

  QueryBuilder<RobotInstance, CareStatData, QQueryOperations> oilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oil');
    });
  }

  QueryBuilder<RobotInstance, Rarity, QQueryOperations> rarityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rarity');
    });
  }

  QueryBuilder<RobotInstance, RobotClass, QQueryOperations>
      robotClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'robotClass');
    });
  }

  QueryBuilder<RobotInstance, int, QQueryOperations> schemaVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'schemaVersion');
    });
  }

  QueryBuilder<RobotInstance, double, QQueryOperations>
      scrapPerSecondProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scrapPerSecond');
    });
  }

  QueryBuilder<RobotInstance, String, QQueryOperations> speciesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speciesId');
    });
  }

  QueryBuilder<RobotInstance, int, QQueryOperations> xpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xp');
    });
  }

  QueryBuilder<RobotInstance, int, QQueryOperations> xpToNextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'xpToNext');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CareStatDataSchema = Schema(
  name: r'CareStatData',
  id: -3247962108403137513,
  properties: {
    r'drainPerSecond': PropertySchema(
      id: 0,
      name: r'drainPerSecond',
      type: IsarType.double,
    ),
    r'max': PropertySchema(
      id: 1,
      name: r'max',
      type: IsarType.double,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _careStatDataEstimateSize,
  serialize: _careStatDataSerialize,
  deserialize: _careStatDataDeserialize,
  deserializeProp: _careStatDataDeserializeProp,
);

int _careStatDataEstimateSize(
  CareStatData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _careStatDataSerialize(
  CareStatData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.drainPerSecond);
  writer.writeDouble(offsets[1], object.max);
  writer.writeDouble(offsets[2], object.value);
}

CareStatData _careStatDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CareStatData();
  object.drainPerSecond = reader.readDouble(offsets[0]);
  object.max = reader.readDouble(offsets[1]);
  object.value = reader.readDouble(offsets[2]);
  return object;
}

P _careStatDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CareStatDataQueryFilter
    on QueryBuilder<CareStatData, CareStatData, QFilterCondition> {
  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition>
      drainPerSecondEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'drainPerSecond',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition>
      drainPerSecondGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'drainPerSecond',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition>
      drainPerSecondLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'drainPerSecond',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition>
      drainPerSecondBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'drainPerSecond',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition> maxEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition>
      maxGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition> maxLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition> maxBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition> valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition>
      valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition> valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CareStatData, CareStatData, QAfterFilterCondition> valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CareStatDataQueryObject
    on QueryBuilder<CareStatData, CareStatData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CombatStatsDataSchema = Schema(
  name: r'CombatStatsData',
  id: -6337436437710959700,
  properties: {
    r'attack': PropertySchema(
      id: 0,
      name: r'attack',
      type: IsarType.long,
    ),
    r'critChance': PropertySchema(
      id: 1,
      name: r'critChance',
      type: IsarType.double,
    ),
    r'defense': PropertySchema(
      id: 2,
      name: r'defense',
      type: IsarType.long,
    ),
    r'hp': PropertySchema(
      id: 3,
      name: r'hp',
      type: IsarType.long,
    ),
    r'speed': PropertySchema(
      id: 4,
      name: r'speed',
      type: IsarType.long,
    )
  },
  estimateSize: _combatStatsDataEstimateSize,
  serialize: _combatStatsDataSerialize,
  deserialize: _combatStatsDataDeserialize,
  deserializeProp: _combatStatsDataDeserializeProp,
);

int _combatStatsDataEstimateSize(
  CombatStatsData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _combatStatsDataSerialize(
  CombatStatsData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attack);
  writer.writeDouble(offsets[1], object.critChance);
  writer.writeLong(offsets[2], object.defense);
  writer.writeLong(offsets[3], object.hp);
  writer.writeLong(offsets[4], object.speed);
}

CombatStatsData _combatStatsDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CombatStatsData();
  object.attack = reader.readLong(offsets[0]);
  object.critChance = reader.readDouble(offsets[1]);
  object.defense = reader.readLong(offsets[2]);
  object.hp = reader.readLong(offsets[3]);
  object.speed = reader.readLong(offsets[4]);
  return object;
}

P _combatStatsDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CombatStatsDataQueryFilter
    on QueryBuilder<CombatStatsData, CombatStatsData, QFilterCondition> {
  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      attackEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attack',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      attackGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attack',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      attackLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attack',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      attackBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      critChanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'critChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      critChanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'critChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      critChanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'critChance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      critChanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'critChance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      defenseEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defense',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      defenseGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defense',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      defenseLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defense',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      defenseBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      hpEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hp',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      hpGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hp',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      hpLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hp',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      hpBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      speedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speed',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      speedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speed',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      speedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speed',
        value: value,
      ));
    });
  }

  QueryBuilder<CombatStatsData, CombatStatsData, QAfterFilterCondition>
      speedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CombatStatsDataQueryObject
    on QueryBuilder<CombatStatsData, CombatStatsData, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const LoadoutSchema = Schema(
  name: r'Loadout',
  id: -5570578815155608350,
  properties: {
    r'armor': PropertySchema(
      id: 0,
      name: r'armor',
      type: IsarType.string,
    ),
    r'core': PropertySchema(
      id: 1,
      name: r'core',
      type: IsarType.string,
    ),
    r'sensor': PropertySchema(
      id: 2,
      name: r'sensor',
      type: IsarType.string,
    ),
    r'utility': PropertySchema(
      id: 3,
      name: r'utility',
      type: IsarType.string,
    ),
    r'wheels': PropertySchema(
      id: 4,
      name: r'wheels',
      type: IsarType.string,
    )
  },
  estimateSize: _loadoutEstimateSize,
  serialize: _loadoutSerialize,
  deserialize: _loadoutDeserialize,
  deserializeProp: _loadoutDeserializeProp,
);

int _loadoutEstimateSize(
  Loadout object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.armor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.core;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sensor;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.utility;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wheels;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _loadoutSerialize(
  Loadout object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.armor);
  writer.writeString(offsets[1], object.core);
  writer.writeString(offsets[2], object.sensor);
  writer.writeString(offsets[3], object.utility);
  writer.writeString(offsets[4], object.wheels);
}

Loadout _loadoutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Loadout();
  object.armor = reader.readStringOrNull(offsets[0]);
  object.core = reader.readStringOrNull(offsets[1]);
  object.sensor = reader.readStringOrNull(offsets[2]);
  object.utility = reader.readStringOrNull(offsets[3]);
  object.wheels = reader.readStringOrNull(offsets[4]);
  return object;
}

P _loadoutDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension LoadoutQueryFilter
    on QueryBuilder<Loadout, Loadout, QFilterCondition> {
  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'armor',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'armor',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'armor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'armor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'armor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'armor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'armor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'armor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'armor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'armor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'armor',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> armorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'armor',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'core',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'core',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'core',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'core',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'core',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'core',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'core',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'core',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'core',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'core',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'core',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> coreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'core',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sensor',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sensor',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sensor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sensor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sensor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sensor',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> sensorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sensor',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'utility',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'utility',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'utility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'utility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'utility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'utility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'utility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'utility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'utility',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'utility',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'utility',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> utilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'utility',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wheels',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wheels',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wheels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wheels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wheels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wheels',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wheels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wheels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wheels',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wheels',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wheels',
        value: '',
      ));
    });
  }

  QueryBuilder<Loadout, Loadout, QAfterFilterCondition> wheelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wheels',
        value: '',
      ));
    });
  }
}

extension LoadoutQueryObject
    on QueryBuilder<Loadout, Loadout, QFilterCondition> {}
