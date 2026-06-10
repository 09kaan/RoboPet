// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placed_decor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlacedDecorCollection on Isar {
  IsarCollection<PlacedDecor> get placedDecors => this.collection();
}

const PlacedDecorSchema = CollectionSchema(
  name: r'PlacedDecor',
  id: -836602958891547514,
  properties: {
    r'flipped': PropertySchema(
      id: 0,
      name: r'flipped',
      type: IsarType.bool,
    ),
    r'itemId': PropertySchema(
      id: 1,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'layer': PropertySchema(
      id: 2,
      name: r'layer',
      type: IsarType.long,
    ),
    r'room': PropertySchema(
      id: 3,
      name: r'room',
      type: IsarType.string,
    ),
    r'scale': PropertySchema(
      id: 4,
      name: r'scale',
      type: IsarType.double,
    ),
    r'x': PropertySchema(
      id: 5,
      name: r'x',
      type: IsarType.double,
    ),
    r'y': PropertySchema(
      id: 6,
      name: r'y',
      type: IsarType.double,
    )
  },
  estimateSize: _placedDecorEstimateSize,
  serialize: _placedDecorSerialize,
  deserialize: _placedDecorDeserialize,
  deserializeProp: _placedDecorDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'itemId': IndexSchema(
      id: -5342806140158601489,
      name: r'itemId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'itemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _placedDecorGetId,
  getLinks: _placedDecorGetLinks,
  attach: _placedDecorAttach,
  version: '3.1.0+1',
);

int _placedDecorEstimateSize(
  PlacedDecor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.room.length * 3;
  return bytesCount;
}

void _placedDecorSerialize(
  PlacedDecor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.flipped);
  writer.writeString(offsets[1], object.itemId);
  writer.writeLong(offsets[2], object.layer);
  writer.writeString(offsets[3], object.room);
  writer.writeDouble(offsets[4], object.scale);
  writer.writeDouble(offsets[5], object.x);
  writer.writeDouble(offsets[6], object.y);
}

PlacedDecor _placedDecorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlacedDecor();
  object.flipped = reader.readBool(offsets[0]);
  object.isarId = id;
  object.itemId = reader.readString(offsets[1]);
  object.layer = reader.readLong(offsets[2]);
  object.room = reader.readString(offsets[3]);
  object.scale = reader.readDouble(offsets[4]);
  object.x = reader.readDouble(offsets[5]);
  object.y = reader.readDouble(offsets[6]);
  return object;
}

P _placedDecorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _placedDecorGetId(PlacedDecor object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _placedDecorGetLinks(PlacedDecor object) {
  return [];
}

void _placedDecorAttach(
    IsarCollection<dynamic> col, Id id, PlacedDecor object) {
  object.isarId = id;
}

extension PlacedDecorQueryWhereSort
    on QueryBuilder<PlacedDecor, PlacedDecor, QWhere> {
  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlacedDecorQueryWhere
    on QueryBuilder<PlacedDecor, PlacedDecor, QWhereClause> {
  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> itemIdEqualTo(
      String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterWhereClause> itemIdNotEqualTo(
      String itemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PlacedDecorQueryFilter
    on QueryBuilder<PlacedDecor, PlacedDecor, QFilterCondition> {
  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> flippedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flipped',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> itemIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> itemIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> layerEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'layer',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      layerGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'layer',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> layerLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'layer',
        value: value,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> layerBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'layer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'room',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'room',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> roomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'room',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      roomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'room',
        value: '',
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> scaleEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition>
      scaleGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> scaleLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> scaleBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> xEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> xGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> xLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> xBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> yEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> yGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> yLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterFilterCondition> yBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlacedDecorQueryObject
    on QueryBuilder<PlacedDecor, PlacedDecor, QFilterCondition> {}

extension PlacedDecorQueryLinks
    on QueryBuilder<PlacedDecor, PlacedDecor, QFilterCondition> {}

extension PlacedDecorQuerySortBy
    on QueryBuilder<PlacedDecor, PlacedDecor, QSortBy> {
  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByFlipped() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flipped', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByFlippedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flipped', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByLayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layer', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByLayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layer', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByRoom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByRoomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scale', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByScaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scale', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> sortByYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.desc);
    });
  }
}

extension PlacedDecorQuerySortThenBy
    on QueryBuilder<PlacedDecor, PlacedDecor, QSortThenBy> {
  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByFlipped() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flipped', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByFlippedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flipped', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByLayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layer', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByLayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'layer', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByRoom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByRoomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scale', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByScaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scale', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.desc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.asc);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QAfterSortBy> thenByYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.desc);
    });
  }
}

extension PlacedDecorQueryWhereDistinct
    on QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> {
  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByFlipped() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flipped');
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByItemId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByLayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'layer');
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByRoom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'room', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scale');
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'x');
    });
  }

  QueryBuilder<PlacedDecor, PlacedDecor, QDistinct> distinctByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'y');
    });
  }
}

extension PlacedDecorQueryProperty
    on QueryBuilder<PlacedDecor, PlacedDecor, QQueryProperty> {
  QueryBuilder<PlacedDecor, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<PlacedDecor, bool, QQueryOperations> flippedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flipped');
    });
  }

  QueryBuilder<PlacedDecor, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<PlacedDecor, int, QQueryOperations> layerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'layer');
    });
  }

  QueryBuilder<PlacedDecor, String, QQueryOperations> roomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'room');
    });
  }

  QueryBuilder<PlacedDecor, double, QQueryOperations> scaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scale');
    });
  }

  QueryBuilder<PlacedDecor, double, QQueryOperations> xProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'x');
    });
  }

  QueryBuilder<PlacedDecor, double, QQueryOperations> yProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'y');
    });
  }
}
