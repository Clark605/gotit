// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ContextsTableTable extends ContextsTable
    with TableInfo<$ContextsTableTable, ContextsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContextsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL COLLATE NOCASE',
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    icon,
    colorValue,
    isDefault,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contexts_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContextsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {name},
  ];
  @override
  ContextsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContextsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ContextsTableTable createAlias(String alias) {
    return $ContextsTableTable(attachedDatabase, alias);
  }
}

class ContextsTableData extends DataClass
    implements Insertable<ContextsTableData> {
  final String id;
  final String name;
  final String? icon;
  final int? colorValue;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ContextsTableData({
    required this.id,
    required this.name,
    this.icon,
    this.colorValue,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    map['is_default'] = Variable<bool>(isDefault);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ContextsTableCompanion toCompanion(bool nullToAbsent) {
    return ContextsTableCompanion(
      id: Value(id),
      name: Value(name),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      isDefault: Value(isDefault),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ContextsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContextsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String?>(json['icon']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String?>(icon),
      'colorValue': serializer.toJson<int?>(colorValue),
      'isDefault': serializer.toJson<bool>(isDefault),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ContextsTableData copyWith({
    String? id,
    String? name,
    Value<String?> icon = const Value.absent(),
    Value<int?> colorValue = const Value.absent(),
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ContextsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon.present ? icon.value : this.icon,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    isDefault: isDefault ?? this.isDefault,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ContextsTableData copyWithCompanion(ContextsTableCompanion data) {
    return ContextsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContextsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('colorValue: $colorValue, ')
          ..write('isDefault: $isDefault, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, icon, colorValue, isDefault, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContextsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.colorValue == this.colorValue &&
          other.isDefault == this.isDefault &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ContextsTableCompanion extends UpdateCompanion<ContextsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> icon;
  final Value<int?> colorValue;
  final Value<bool> isDefault;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ContextsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContextsTableCompanion.insert({
    required String id,
    required String name,
    this.icon = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<ContextsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<int>? colorValue,
    Expression<bool>? isDefault,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (colorValue != null) 'color_value': colorValue,
      if (isDefault != null) 'is_default': isDefault,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContextsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? icon,
    Value<int?>? colorValue,
    Value<bool>? isDefault,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ContextsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      colorValue: colorValue ?? this.colorValue,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContextsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('colorValue: $colorValue, ')
          ..write('isDefault: $isDefault, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTableTable extends TasksTable
    with TableInfo<$TasksTableTable, TasksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('open'),
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAllDayMeta = const VerificationMeta(
    'isAllDay',
  );
  @override
  late final GeneratedColumn<bool> isAllDay = GeneratedColumn<bool>(
    'is_all_day',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_all_day" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _contextIdMeta = const VerificationMeta(
    'contextId',
  );
  @override
  late final GeneratedColumn<String> contextId = GeneratedColumn<String>(
    'context_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES contexts_table (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _effortMinutesMeta = const VerificationMeta(
    'effortMinutes',
  );
  @override
  late final GeneratedColumn<int> effortMinutes = GeneratedColumn<int>(
    'effort_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceExcerptMeta = const VerificationMeta(
    'sourceExcerpt',
  );
  @override
  late final GeneratedColumn<String> sourceExcerpt = GeneratedColumn<String>(
    'source_excerpt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isReminderEnabledMeta = const VerificationMeta(
    'isReminderEnabled',
  );
  @override
  late final GeneratedColumn<bool> isReminderEnabled = GeneratedColumn<bool>(
    'is_reminder_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_reminder_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderLeadMinutesMeta =
      const VerificationMeta('reminderLeadMinutes');
  @override
  late final GeneratedColumn<int> reminderLeadMinutes = GeneratedColumn<int>(
    'reminder_lead_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allDayReminderTimeMeta =
      const VerificationMeta('allDayReminderTime');
  @override
  late final GeneratedColumn<String> allDayReminderTime =
      GeneratedColumn<String>(
        'all_day_reminder_time',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    status,
    dueDate,
    isAllDay,
    contextId,
    notes,
    effortMinutes,
    sourceExcerpt,
    isDeleted,
    createdAt,
    updatedAt,
    isReminderEnabled,
    reminderLeadMinutes,
    allDayReminderTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TasksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('is_all_day')) {
      context.handle(
        _isAllDayMeta,
        isAllDay.isAcceptableOrUnknown(data['is_all_day']!, _isAllDayMeta),
      );
    }
    if (data.containsKey('context_id')) {
      context.handle(
        _contextIdMeta,
        contextId.isAcceptableOrUnknown(data['context_id']!, _contextIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('effort_minutes')) {
      context.handle(
        _effortMinutesMeta,
        effortMinutes.isAcceptableOrUnknown(
          data['effort_minutes']!,
          _effortMinutesMeta,
        ),
      );
    }
    if (data.containsKey('source_excerpt')) {
      context.handle(
        _sourceExcerptMeta,
        sourceExcerpt.isAcceptableOrUnknown(
          data['source_excerpt']!,
          _sourceExcerptMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_reminder_enabled')) {
      context.handle(
        _isReminderEnabledMeta,
        isReminderEnabled.isAcceptableOrUnknown(
          data['is_reminder_enabled']!,
          _isReminderEnabledMeta,
        ),
      );
    }
    if (data.containsKey('reminder_lead_minutes')) {
      context.handle(
        _reminderLeadMinutesMeta,
        reminderLeadMinutes.isAcceptableOrUnknown(
          data['reminder_lead_minutes']!,
          _reminderLeadMinutesMeta,
        ),
      );
    }
    if (data.containsKey('all_day_reminder_time')) {
      context.handle(
        _allDayReminderTimeMeta,
        allDayReminderTime.isAcceptableOrUnknown(
          data['all_day_reminder_time']!,
          _allDayReminderTimeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TasksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      isAllDay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_all_day'],
      )!,
      contextId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}context_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      effortMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}effort_minutes'],
      ),
      sourceExcerpt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_excerpt'],
      ),
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isReminderEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_reminder_enabled'],
      )!,
      reminderLeadMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_lead_minutes'],
      ),
      allDayReminderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}all_day_reminder_time'],
      ),
    );
  }

  @override
  $TasksTableTable createAlias(String alias) {
    return $TasksTableTable(attachedDatabase, alias);
  }
}

class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String title;
  final String status;
  final DateTime? dueDate;
  final bool isAllDay;
  final String? contextId;
  final String notes;
  final int? effortMinutes;
  final String? sourceExcerpt;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isReminderEnabled;
  final int? reminderLeadMinutes;
  final String? allDayReminderTime;
  const TasksTableData({
    required this.id,
    required this.title,
    required this.status,
    this.dueDate,
    required this.isAllDay,
    this.contextId,
    required this.notes,
    this.effortMinutes,
    this.sourceExcerpt,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.isReminderEnabled,
    this.reminderLeadMinutes,
    this.allDayReminderTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['is_all_day'] = Variable<bool>(isAllDay);
    if (!nullToAbsent || contextId != null) {
      map['context_id'] = Variable<String>(contextId);
    }
    map['notes'] = Variable<String>(notes);
    if (!nullToAbsent || effortMinutes != null) {
      map['effort_minutes'] = Variable<int>(effortMinutes);
    }
    if (!nullToAbsent || sourceExcerpt != null) {
      map['source_excerpt'] = Variable<String>(sourceExcerpt);
    }
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_reminder_enabled'] = Variable<bool>(isReminderEnabled);
    if (!nullToAbsent || reminderLeadMinutes != null) {
      map['reminder_lead_minutes'] = Variable<int>(reminderLeadMinutes);
    }
    if (!nullToAbsent || allDayReminderTime != null) {
      map['all_day_reminder_time'] = Variable<String>(allDayReminderTime);
    }
    return map;
  }

  TasksTableCompanion toCompanion(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(id),
      title: Value(title),
      status: Value(status),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      isAllDay: Value(isAllDay),
      contextId: contextId == null && nullToAbsent
          ? const Value.absent()
          : Value(contextId),
      notes: Value(notes),
      effortMinutes: effortMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(effortMinutes),
      sourceExcerpt: sourceExcerpt == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceExcerpt),
      isDeleted: Value(isDeleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isReminderEnabled: Value(isReminderEnabled),
      reminderLeadMinutes: reminderLeadMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderLeadMinutes),
      allDayReminderTime: allDayReminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(allDayReminderTime),
    );
  }

  factory TasksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      status: serializer.fromJson<String>(json['status']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      isAllDay: serializer.fromJson<bool>(json['isAllDay']),
      contextId: serializer.fromJson<String?>(json['contextId']),
      notes: serializer.fromJson<String>(json['notes']),
      effortMinutes: serializer.fromJson<int?>(json['effortMinutes']),
      sourceExcerpt: serializer.fromJson<String?>(json['sourceExcerpt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isReminderEnabled: serializer.fromJson<bool>(json['isReminderEnabled']),
      reminderLeadMinutes: serializer.fromJson<int?>(
        json['reminderLeadMinutes'],
      ),
      allDayReminderTime: serializer.fromJson<String?>(
        json['allDayReminderTime'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'status': serializer.toJson<String>(status),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'isAllDay': serializer.toJson<bool>(isAllDay),
      'contextId': serializer.toJson<String?>(contextId),
      'notes': serializer.toJson<String>(notes),
      'effortMinutes': serializer.toJson<int?>(effortMinutes),
      'sourceExcerpt': serializer.toJson<String?>(sourceExcerpt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isReminderEnabled': serializer.toJson<bool>(isReminderEnabled),
      'reminderLeadMinutes': serializer.toJson<int?>(reminderLeadMinutes),
      'allDayReminderTime': serializer.toJson<String?>(allDayReminderTime),
    };
  }

  TasksTableData copyWith({
    String? id,
    String? title,
    String? status,
    Value<DateTime?> dueDate = const Value.absent(),
    bool? isAllDay,
    Value<String?> contextId = const Value.absent(),
    String? notes,
    Value<int?> effortMinutes = const Value.absent(),
    Value<String?> sourceExcerpt = const Value.absent(),
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isReminderEnabled,
    Value<int?> reminderLeadMinutes = const Value.absent(),
    Value<String?> allDayReminderTime = const Value.absent(),
  }) => TasksTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    status: status ?? this.status,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    isAllDay: isAllDay ?? this.isAllDay,
    contextId: contextId.present ? contextId.value : this.contextId,
    notes: notes ?? this.notes,
    effortMinutes: effortMinutes.present
        ? effortMinutes.value
        : this.effortMinutes,
    sourceExcerpt: sourceExcerpt.present
        ? sourceExcerpt.value
        : this.sourceExcerpt,
    isDeleted: isDeleted ?? this.isDeleted,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isReminderEnabled: isReminderEnabled ?? this.isReminderEnabled,
    reminderLeadMinutes: reminderLeadMinutes.present
        ? reminderLeadMinutes.value
        : this.reminderLeadMinutes,
    allDayReminderTime: allDayReminderTime.present
        ? allDayReminderTime.value
        : this.allDayReminderTime,
  );
  TasksTableData copyWithCompanion(TasksTableCompanion data) {
    return TasksTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      status: data.status.present ? data.status.value : this.status,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      isAllDay: data.isAllDay.present ? data.isAllDay.value : this.isAllDay,
      contextId: data.contextId.present ? data.contextId.value : this.contextId,
      notes: data.notes.present ? data.notes.value : this.notes,
      effortMinutes: data.effortMinutes.present
          ? data.effortMinutes.value
          : this.effortMinutes,
      sourceExcerpt: data.sourceExcerpt.present
          ? data.sourceExcerpt.value
          : this.sourceExcerpt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isReminderEnabled: data.isReminderEnabled.present
          ? data.isReminderEnabled.value
          : this.isReminderEnabled,
      reminderLeadMinutes: data.reminderLeadMinutes.present
          ? data.reminderLeadMinutes.value
          : this.reminderLeadMinutes,
      allDayReminderTime: data.allDayReminderTime.present
          ? data.allDayReminderTime.value
          : this.allDayReminderTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('isAllDay: $isAllDay, ')
          ..write('contextId: $contextId, ')
          ..write('notes: $notes, ')
          ..write('effortMinutes: $effortMinutes, ')
          ..write('sourceExcerpt: $sourceExcerpt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isReminderEnabled: $isReminderEnabled, ')
          ..write('reminderLeadMinutes: $reminderLeadMinutes, ')
          ..write('allDayReminderTime: $allDayReminderTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    status,
    dueDate,
    isAllDay,
    contextId,
    notes,
    effortMinutes,
    sourceExcerpt,
    isDeleted,
    createdAt,
    updatedAt,
    isReminderEnabled,
    reminderLeadMinutes,
    allDayReminderTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TasksTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.status == this.status &&
          other.dueDate == this.dueDate &&
          other.isAllDay == this.isAllDay &&
          other.contextId == this.contextId &&
          other.notes == this.notes &&
          other.effortMinutes == this.effortMinutes &&
          other.sourceExcerpt == this.sourceExcerpt &&
          other.isDeleted == this.isDeleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isReminderEnabled == this.isReminderEnabled &&
          other.reminderLeadMinutes == this.reminderLeadMinutes &&
          other.allDayReminderTime == this.allDayReminderTime);
}

class TasksTableCompanion extends UpdateCompanion<TasksTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> status;
  final Value<DateTime?> dueDate;
  final Value<bool> isAllDay;
  final Value<String?> contextId;
  final Value<String> notes;
  final Value<int?> effortMinutes;
  final Value<String?> sourceExcerpt;
  final Value<bool> isDeleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isReminderEnabled;
  final Value<int?> reminderLeadMinutes;
  final Value<String?> allDayReminderTime;
  final Value<int> rowid;
  const TasksTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isAllDay = const Value.absent(),
    this.contextId = const Value.absent(),
    this.notes = const Value.absent(),
    this.effortMinutes = const Value.absent(),
    this.sourceExcerpt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isReminderEnabled = const Value.absent(),
    this.reminderLeadMinutes = const Value.absent(),
    this.allDayReminderTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String title,
    this.status = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isAllDay = const Value.absent(),
    this.contextId = const Value.absent(),
    this.notes = const Value.absent(),
    this.effortMinutes = const Value.absent(),
    this.sourceExcerpt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isReminderEnabled = const Value.absent(),
    this.reminderLeadMinutes = const Value.absent(),
    this.allDayReminderTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<TasksTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? status,
    Expression<DateTime>? dueDate,
    Expression<bool>? isAllDay,
    Expression<String>? contextId,
    Expression<String>? notes,
    Expression<int>? effortMinutes,
    Expression<String>? sourceExcerpt,
    Expression<bool>? isDeleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isReminderEnabled,
    Expression<int>? reminderLeadMinutes,
    Expression<String>? allDayReminderTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (status != null) 'status': status,
      if (dueDate != null) 'due_date': dueDate,
      if (isAllDay != null) 'is_all_day': isAllDay,
      if (contextId != null) 'context_id': contextId,
      if (notes != null) 'notes': notes,
      if (effortMinutes != null) 'effort_minutes': effortMinutes,
      if (sourceExcerpt != null) 'source_excerpt': sourceExcerpt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isReminderEnabled != null) 'is_reminder_enabled': isReminderEnabled,
      if (reminderLeadMinutes != null)
        'reminder_lead_minutes': reminderLeadMinutes,
      if (allDayReminderTime != null)
        'all_day_reminder_time': allDayReminderTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? status,
    Value<DateTime?>? dueDate,
    Value<bool>? isAllDay,
    Value<String?>? contextId,
    Value<String>? notes,
    Value<int?>? effortMinutes,
    Value<String?>? sourceExcerpt,
    Value<bool>? isDeleted,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isReminderEnabled,
    Value<int?>? reminderLeadMinutes,
    Value<String?>? allDayReminderTime,
    Value<int>? rowid,
  }) {
    return TasksTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      isAllDay: isAllDay ?? this.isAllDay,
      contextId: contextId ?? this.contextId,
      notes: notes ?? this.notes,
      effortMinutes: effortMinutes ?? this.effortMinutes,
      sourceExcerpt: sourceExcerpt ?? this.sourceExcerpt,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isReminderEnabled: isReminderEnabled ?? this.isReminderEnabled,
      reminderLeadMinutes: reminderLeadMinutes ?? this.reminderLeadMinutes,
      allDayReminderTime: allDayReminderTime ?? this.allDayReminderTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (isAllDay.present) {
      map['is_all_day'] = Variable<bool>(isAllDay.value);
    }
    if (contextId.present) {
      map['context_id'] = Variable<String>(contextId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (effortMinutes.present) {
      map['effort_minutes'] = Variable<int>(effortMinutes.value);
    }
    if (sourceExcerpt.present) {
      map['source_excerpt'] = Variable<String>(sourceExcerpt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isReminderEnabled.present) {
      map['is_reminder_enabled'] = Variable<bool>(isReminderEnabled.value);
    }
    if (reminderLeadMinutes.present) {
      map['reminder_lead_minutes'] = Variable<int>(reminderLeadMinutes.value);
    }
    if (allDayReminderTime.present) {
      map['all_day_reminder_time'] = Variable<String>(allDayReminderTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('status: $status, ')
          ..write('dueDate: $dueDate, ')
          ..write('isAllDay: $isAllDay, ')
          ..write('contextId: $contextId, ')
          ..write('notes: $notes, ')
          ..write('effortMinutes: $effortMinutes, ')
          ..write('sourceExcerpt: $sourceExcerpt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isReminderEnabled: $isReminderEnabled, ')
          ..write('reminderLeadMinutes: $reminderLeadMinutes, ')
          ..write('allDayReminderTime: $allDayReminderTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChecklistItemsTableTable extends ChecklistItemsTable
    with TableInfo<$ChecklistItemsTableTable, ChecklistItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    taskId,
    content,
    isCompleted,
    sortOrder,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_items_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistItemsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistItemsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistItemsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ChecklistItemsTableTable createAlias(String alias) {
    return $ChecklistItemsTableTable(attachedDatabase, alias);
  }
}

class ChecklistItemsTableData extends DataClass
    implements Insertable<ChecklistItemsTableData> {
  final String id;
  final String taskId;
  final String content;
  final bool isCompleted;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ChecklistItemsTableData({
    required this.id,
    required this.taskId,
    required this.content,
    required this.isCompleted,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['content'] = Variable<String>(content);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ChecklistItemsTableCompanion toCompanion(bool nullToAbsent) {
    return ChecklistItemsTableCompanion(
      id: Value(id),
      taskId: Value(taskId),
      content: Value(content),
      isCompleted: Value(isCompleted),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ChecklistItemsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistItemsTableData(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      content: serializer.fromJson<String>(json['content']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'content': serializer.toJson<String>(content),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ChecklistItemsTableData copyWith({
    String? id,
    String? taskId,
    String? content,
    bool? isCompleted,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ChecklistItemsTableData(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    content: content ?? this.content,
    isCompleted: isCompleted ?? this.isCompleted,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ChecklistItemsTableData copyWithCompanion(ChecklistItemsTableCompanion data) {
    return ChecklistItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      content: data.content.present ? data.content.value : this.content,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsTableData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('content: $content, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    taskId,
    content,
    isCompleted,
    sortOrder,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistItemsTableData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.content == this.content &&
          other.isCompleted == this.isCompleted &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ChecklistItemsTableCompanion
    extends UpdateCompanion<ChecklistItemsTableData> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<String> content;
  final Value<bool> isCompleted;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ChecklistItemsTableCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.content = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChecklistItemsTableCompanion.insert({
    required String id,
    required String taskId,
    required String content,
    this.isCompleted = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       content = Value(content);
  static Insertable<ChecklistItemsTableData> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<String>? content,
    Expression<bool>? isCompleted,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (content != null) 'content': content,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChecklistItemsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<String>? content,
    Value<bool>? isCompleted,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ChecklistItemsTableCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('content: $content, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTableTable extends RemindersTable
    with TableInfo<$RemindersTableTable, RemindersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledTimeMeta = const VerificationMeta(
    'scheduledTime',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledTime =
      GeneratedColumn<DateTime>(
        'scheduled_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _leadTimeMinutesMeta = const VerificationMeta(
    'leadTimeMinutes',
  );
  @override
  late final GeneratedColumn<int> leadTimeMinutes = GeneratedColumn<int>(
    'lead_time_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    taskId,
    type,
    scheduledTime,
    leadTimeMinutes,
    status,
    notificationId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RemindersTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
        _scheduledTimeMeta,
        scheduledTime.isAcceptableOrUnknown(
          data['scheduled_time']!,
          _scheduledTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('lead_time_minutes')) {
      context.handle(
        _leadTimeMinutesMeta,
        leadTimeMinutes.isAcceptableOrUnknown(
          data['lead_time_minutes']!,
          _leadTimeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RemindersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RemindersTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      scheduledTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_time'],
      )!,
      leadTimeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lead_time_minutes'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RemindersTableTable createAlias(String alias) {
    return $RemindersTableTable(attachedDatabase, alias);
  }
}

class RemindersTableData extends DataClass
    implements Insertable<RemindersTableData> {
  final String id;
  final String taskId;
  final String type;
  final DateTime scheduledTime;
  final int leadTimeMinutes;
  final String status;
  final int notificationId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RemindersTableData({
    required this.id,
    required this.taskId,
    required this.type,
    required this.scheduledTime,
    required this.leadTimeMinutes,
    required this.status,
    required this.notificationId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['type'] = Variable<String>(type);
    map['scheduled_time'] = Variable<DateTime>(scheduledTime);
    map['lead_time_minutes'] = Variable<int>(leadTimeMinutes);
    map['status'] = Variable<String>(status);
    map['notification_id'] = Variable<int>(notificationId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RemindersTableCompanion toCompanion(bool nullToAbsent) {
    return RemindersTableCompanion(
      id: Value(id),
      taskId: Value(taskId),
      type: Value(type),
      scheduledTime: Value(scheduledTime),
      leadTimeMinutes: Value(leadTimeMinutes),
      status: Value(status),
      notificationId: Value(notificationId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RemindersTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RemindersTableData(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      type: serializer.fromJson<String>(json['type']),
      scheduledTime: serializer.fromJson<DateTime>(json['scheduledTime']),
      leadTimeMinutes: serializer.fromJson<int>(json['leadTimeMinutes']),
      status: serializer.fromJson<String>(json['status']),
      notificationId: serializer.fromJson<int>(json['notificationId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'type': serializer.toJson<String>(type),
      'scheduledTime': serializer.toJson<DateTime>(scheduledTime),
      'leadTimeMinutes': serializer.toJson<int>(leadTimeMinutes),
      'status': serializer.toJson<String>(status),
      'notificationId': serializer.toJson<int>(notificationId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RemindersTableData copyWith({
    String? id,
    String? taskId,
    String? type,
    DateTime? scheduledTime,
    int? leadTimeMinutes,
    String? status,
    int? notificationId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => RemindersTableData(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    type: type ?? this.type,
    scheduledTime: scheduledTime ?? this.scheduledTime,
    leadTimeMinutes: leadTimeMinutes ?? this.leadTimeMinutes,
    status: status ?? this.status,
    notificationId: notificationId ?? this.notificationId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RemindersTableData copyWithCompanion(RemindersTableCompanion data) {
    return RemindersTableData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      type: data.type.present ? data.type.value : this.type,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      leadTimeMinutes: data.leadTimeMinutes.present
          ? data.leadTimeMinutes.value
          : this.leadTimeMinutes,
      status: data.status.present ? data.status.value : this.status,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RemindersTableData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('type: $type, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('leadTimeMinutes: $leadTimeMinutes, ')
          ..write('status: $status, ')
          ..write('notificationId: $notificationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    taskId,
    type,
    scheduledTime,
    leadTimeMinutes,
    status,
    notificationId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RemindersTableData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.type == this.type &&
          other.scheduledTime == this.scheduledTime &&
          other.leadTimeMinutes == this.leadTimeMinutes &&
          other.status == this.status &&
          other.notificationId == this.notificationId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RemindersTableCompanion extends UpdateCompanion<RemindersTableData> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<String> type;
  final Value<DateTime> scheduledTime;
  final Value<int> leadTimeMinutes;
  final Value<String> status;
  final Value<int> notificationId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RemindersTableCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.type = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.leadTimeMinutes = const Value.absent(),
    this.status = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersTableCompanion.insert({
    required String id,
    required String taskId,
    required String type,
    required DateTime scheduledTime,
    this.leadTimeMinutes = const Value.absent(),
    this.status = const Value.absent(),
    required int notificationId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       type = Value(type),
       scheduledTime = Value(scheduledTime),
       notificationId = Value(notificationId);
  static Insertable<RemindersTableData> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<String>? type,
    Expression<DateTime>? scheduledTime,
    Expression<int>? leadTimeMinutes,
    Expression<String>? status,
    Expression<int>? notificationId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (type != null) 'type': type,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (leadTimeMinutes != null) 'lead_time_minutes': leadTimeMinutes,
      if (status != null) 'status': status,
      if (notificationId != null) 'notification_id': notificationId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersTableCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<String>? type,
    Value<DateTime>? scheduledTime,
    Value<int>? leadTimeMinutes,
    Value<String>? status,
    Value<int>? notificationId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RemindersTableCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      type: type ?? this.type,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      leadTimeMinutes: leadTimeMinutes ?? this.leadTimeMinutes,
      status: status ?? this.status,
      notificationId: notificationId ?? this.notificationId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<DateTime>(scheduledTime.value);
    }
    if (leadTimeMinutes.present) {
      map['lead_time_minutes'] = Variable<int>(leadTimeMinutes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersTableCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('type: $type, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('leadTimeMinutes: $leadTimeMinutes, ')
          ..write('status: $status, ')
          ..write('notificationId: $notificationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ContextsTableTable contextsTable = $ContextsTableTable(this);
  late final $TasksTableTable tasksTable = $TasksTableTable(this);
  late final $ChecklistItemsTableTable checklistItemsTable =
      $ChecklistItemsTableTable(this);
  late final $RemindersTableTable remindersTable = $RemindersTableTable(this);
  late final Index tasksStatusDeletedDueIdx = Index(
    'tasks_status_deleted_due_idx',
    'CREATE INDEX tasks_status_deleted_due_idx ON tasks_table (status, is_deleted, due_date)',
  );
  late final Index tasksContextDeletedIdx = Index(
    'tasks_context_deleted_idx',
    'CREATE INDEX tasks_context_deleted_idx ON tasks_table (context_id, is_deleted)',
  );
  late final Index checklistTaskOrderIdx = Index(
    'checklist_task_order_idx',
    'CREATE INDEX checklist_task_order_idx ON checklist_items_table (task_id, sort_order)',
  );
  late final Index remindersTaskIdx = Index(
    'reminders_task_idx',
    'CREATE INDEX reminders_task_idx ON reminders_table (task_id)',
  );
  late final Index remindersStatusTimeIdx = Index(
    'reminders_status_time_idx',
    'CREATE INDEX reminders_status_time_idx ON reminders_table (status, scheduled_time)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    contextsTable,
    tasksTable,
    checklistItemsTable,
    remindersTable,
    tasksStatusDeletedDueIdx,
    tasksContextDeletedIdx,
    checklistTaskOrderIdx,
    remindersTaskIdx,
    remindersStatusTimeIdx,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'contexts_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('tasks_table', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tasks_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('checklist_items_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tasks_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminders_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ContextsTableTableCreateCompanionBuilder =
    ContextsTableCompanion Function({
      required String id,
      required String name,
      Value<String?> icon,
      Value<int?> colorValue,
      Value<bool> isDefault,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ContextsTableTableUpdateCompanionBuilder =
    ContextsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> icon,
      Value<int?> colorValue,
      Value<bool> isDefault,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ContextsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ContextsTableTable, ContextsTableData> {
  $$ContextsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TasksTableTable, List<TasksTableData>>
  _tasksTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tasksTable,
    aliasName: $_aliasNameGenerator(
      db.contextsTable.id,
      db.tasksTable.contextId,
    ),
  );

  $$TasksTableTableProcessedTableManager get tasksTableRefs {
    final manager = $$TasksTableTableTableManager(
      $_db,
      $_db.tasksTable,
    ).filter((f) => f.contextId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ContextsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ContextsTableTable> {
  $$ContextsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tasksTableRefs(
    Expression<bool> Function($$TasksTableTableFilterComposer f) f,
  ) {
    final $$TasksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.contextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableFilterComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContextsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ContextsTableTable> {
  $$ContextsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContextsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContextsTableTable> {
  $$ContextsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> tasksTableRefs<T extends Object>(
    Expression<T> Function($$TasksTableTableAnnotationComposer a) f,
  ) {
    final $$TasksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.contextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContextsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContextsTableTable,
          ContextsTableData,
          $$ContextsTableTableFilterComposer,
          $$ContextsTableTableOrderingComposer,
          $$ContextsTableTableAnnotationComposer,
          $$ContextsTableTableCreateCompanionBuilder,
          $$ContextsTableTableUpdateCompanionBuilder,
          (ContextsTableData, $$ContextsTableTableReferences),
          ContextsTableData,
          PrefetchHooks Function({bool tasksTableRefs})
        > {
  $$ContextsTableTableTableManager(_$AppDatabase db, $ContextsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContextsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContextsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContextsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContextsTableCompanion(
                id: id,
                name: name,
                icon: icon,
                colorValue: colorValue,
                isDefault: isDefault,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> icon = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContextsTableCompanion.insert(
                id: id,
                name: name,
                icon: icon,
                colorValue: colorValue,
                isDefault: isDefault,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ContextsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tasksTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksTableRefs) db.tasksTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksTableRefs)
                    await $_getPrefetchedData<
                      ContextsTableData,
                      $ContextsTableTable,
                      TasksTableData
                    >(
                      currentTable: table,
                      referencedTable: $$ContextsTableTableReferences
                          ._tasksTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ContextsTableTableReferences(
                            db,
                            table,
                            p0,
                          ).tasksTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.contextId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ContextsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContextsTableTable,
      ContextsTableData,
      $$ContextsTableTableFilterComposer,
      $$ContextsTableTableOrderingComposer,
      $$ContextsTableTableAnnotationComposer,
      $$ContextsTableTableCreateCompanionBuilder,
      $$ContextsTableTableUpdateCompanionBuilder,
      (ContextsTableData, $$ContextsTableTableReferences),
      ContextsTableData,
      PrefetchHooks Function({bool tasksTableRefs})
    >;
typedef $$TasksTableTableCreateCompanionBuilder =
    TasksTableCompanion Function({
      required String id,
      required String title,
      Value<String> status,
      Value<DateTime?> dueDate,
      Value<bool> isAllDay,
      Value<String?> contextId,
      Value<String> notes,
      Value<int?> effortMinutes,
      Value<String?> sourceExcerpt,
      Value<bool> isDeleted,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isReminderEnabled,
      Value<int?> reminderLeadMinutes,
      Value<String?> allDayReminderTime,
      Value<int> rowid,
    });
typedef $$TasksTableTableUpdateCompanionBuilder =
    TasksTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> status,
      Value<DateTime?> dueDate,
      Value<bool> isAllDay,
      Value<String?> contextId,
      Value<String> notes,
      Value<int?> effortMinutes,
      Value<String?> sourceExcerpt,
      Value<bool> isDeleted,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isReminderEnabled,
      Value<int?> reminderLeadMinutes,
      Value<String?> allDayReminderTime,
      Value<int> rowid,
    });

final class $$TasksTableTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTableTable, TasksTableData> {
  $$TasksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ContextsTableTable _contextIdTable(_$AppDatabase db) =>
      db.contextsTable.createAlias(
        $_aliasNameGenerator(db.tasksTable.contextId, db.contextsTable.id),
      );

  $$ContextsTableTableProcessedTableManager? get contextId {
    final $_column = $_itemColumn<String>('context_id');
    if ($_column == null) return null;
    final manager = $$ContextsTableTableTableManager(
      $_db,
      $_db.contextsTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contextIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ChecklistItemsTableTable,
    List<ChecklistItemsTableData>
  >
  _checklistItemsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.checklistItemsTable,
        aliasName: $_aliasNameGenerator(
          db.tasksTable.id,
          db.checklistItemsTable.taskId,
        ),
      );

  $$ChecklistItemsTableTableProcessedTableManager get checklistItemsTableRefs {
    final manager = $$ChecklistItemsTableTableTableManager(
      $_db,
      $_db.checklistItemsTable,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _checklistItemsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RemindersTableTable, List<RemindersTableData>>
  _remindersTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.remindersTable,
    aliasName: $_aliasNameGenerator(db.tasksTable.id, db.remindersTable.taskId),
  );

  $$RemindersTableTableProcessedTableManager get remindersTableRefs {
    final manager = $$RemindersTableTableTableManager(
      $_db,
      $_db.remindersTable,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TasksTableTableFilterComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAllDay => $composableBuilder(
    column: $table.isAllDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get effortMinutes => $composableBuilder(
    column: $table.effortMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceExcerpt => $composableBuilder(
    column: $table.sourceExcerpt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isReminderEnabled => $composableBuilder(
    column: $table.isReminderEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderLeadMinutes => $composableBuilder(
    column: $table.reminderLeadMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allDayReminderTime => $composableBuilder(
    column: $table.allDayReminderTime,
    builder: (column) => ColumnFilters(column),
  );

  $$ContextsTableTableFilterComposer get contextId {
    final $$ContextsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contextId,
      referencedTable: $db.contextsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContextsTableTableFilterComposer(
            $db: $db,
            $table: $db.contextsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> checklistItemsTableRefs(
    Expression<bool> Function($$ChecklistItemsTableTableFilterComposer f) f,
  ) {
    final $$ChecklistItemsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checklistItemsTable,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChecklistItemsTableTableFilterComposer(
            $db: $db,
            $table: $db.checklistItemsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersTableRefs(
    Expression<bool> Function($$RemindersTableTableFilterComposer f) f,
  ) {
    final $$RemindersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.remindersTable,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableTableFilterComposer(
            $db: $db,
            $table: $db.remindersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAllDay => $composableBuilder(
    column: $table.isAllDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get effortMinutes => $composableBuilder(
    column: $table.effortMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceExcerpt => $composableBuilder(
    column: $table.sourceExcerpt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isReminderEnabled => $composableBuilder(
    column: $table.isReminderEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderLeadMinutes => $composableBuilder(
    column: $table.reminderLeadMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allDayReminderTime => $composableBuilder(
    column: $table.allDayReminderTime,
    builder: (column) => ColumnOrderings(column),
  );

  $$ContextsTableTableOrderingComposer get contextId {
    final $$ContextsTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contextId,
      referencedTable: $db.contextsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContextsTableTableOrderingComposer(
            $db: $db,
            $table: $db.contextsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTableTable> {
  $$TasksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<bool> get isAllDay =>
      $composableBuilder(column: $table.isAllDay, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get effortMinutes => $composableBuilder(
    column: $table.effortMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceExcerpt => $composableBuilder(
    column: $table.sourceExcerpt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isReminderEnabled => $composableBuilder(
    column: $table.isReminderEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminderLeadMinutes => $composableBuilder(
    column: $table.reminderLeadMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get allDayReminderTime => $composableBuilder(
    column: $table.allDayReminderTime,
    builder: (column) => column,
  );

  $$ContextsTableTableAnnotationComposer get contextId {
    final $$ContextsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contextId,
      referencedTable: $db.contextsTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContextsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.contextsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> checklistItemsTableRefs<T extends Object>(
    Expression<T> Function($$ChecklistItemsTableTableAnnotationComposer a) f,
  ) {
    final $$ChecklistItemsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.checklistItemsTable,
          getReferencedColumn: (t) => t.taskId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ChecklistItemsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.checklistItemsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> remindersTableRefs<T extends Object>(
    Expression<T> Function($$RemindersTableTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.remindersTable,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.remindersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTableTable,
          TasksTableData,
          $$TasksTableTableFilterComposer,
          $$TasksTableTableOrderingComposer,
          $$TasksTableTableAnnotationComposer,
          $$TasksTableTableCreateCompanionBuilder,
          $$TasksTableTableUpdateCompanionBuilder,
          (TasksTableData, $$TasksTableTableReferences),
          TasksTableData,
          PrefetchHooks Function({
            bool contextId,
            bool checklistItemsTableRefs,
            bool remindersTableRefs,
          })
        > {
  $$TasksTableTableTableManager(_$AppDatabase db, $TasksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<bool> isAllDay = const Value.absent(),
                Value<String?> contextId = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int?> effortMinutes = const Value.absent(),
                Value<String?> sourceExcerpt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isReminderEnabled = const Value.absent(),
                Value<int?> reminderLeadMinutes = const Value.absent(),
                Value<String?> allDayReminderTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion(
                id: id,
                title: title,
                status: status,
                dueDate: dueDate,
                isAllDay: isAllDay,
                contextId: contextId,
                notes: notes,
                effortMinutes: effortMinutes,
                sourceExcerpt: sourceExcerpt,
                isDeleted: isDeleted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isReminderEnabled: isReminderEnabled,
                reminderLeadMinutes: reminderLeadMinutes,
                allDayReminderTime: allDayReminderTime,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String> status = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<bool> isAllDay = const Value.absent(),
                Value<String?> contextId = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int?> effortMinutes = const Value.absent(),
                Value<String?> sourceExcerpt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isReminderEnabled = const Value.absent(),
                Value<int?> reminderLeadMinutes = const Value.absent(),
                Value<String?> allDayReminderTime = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksTableCompanion.insert(
                id: id,
                title: title,
                status: status,
                dueDate: dueDate,
                isAllDay: isAllDay,
                contextId: contextId,
                notes: notes,
                effortMinutes: effortMinutes,
                sourceExcerpt: sourceExcerpt,
                isDeleted: isDeleted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isReminderEnabled: isReminderEnabled,
                reminderLeadMinutes: reminderLeadMinutes,
                allDayReminderTime: allDayReminderTime,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TasksTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                contextId = false,
                checklistItemsTableRefs = false,
                remindersTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (checklistItemsTableRefs) db.checklistItemsTable,
                    if (remindersTableRefs) db.remindersTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (contextId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.contextId,
                                    referencedTable: $$TasksTableTableReferences
                                        ._contextIdTable(db),
                                    referencedColumn:
                                        $$TasksTableTableReferences
                                            ._contextIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (checklistItemsTableRefs)
                        await $_getPrefetchedData<
                          TasksTableData,
                          $TasksTableTable,
                          ChecklistItemsTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableTableReferences
                              ._checklistItemsTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).checklistItemsTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taskId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (remindersTableRefs)
                        await $_getPrefetchedData<
                          TasksTableData,
                          $TasksTableTable,
                          RemindersTableData
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableTableReferences
                              ._remindersTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taskId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TasksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTableTable,
      TasksTableData,
      $$TasksTableTableFilterComposer,
      $$TasksTableTableOrderingComposer,
      $$TasksTableTableAnnotationComposer,
      $$TasksTableTableCreateCompanionBuilder,
      $$TasksTableTableUpdateCompanionBuilder,
      (TasksTableData, $$TasksTableTableReferences),
      TasksTableData,
      PrefetchHooks Function({
        bool contextId,
        bool checklistItemsTableRefs,
        bool remindersTableRefs,
      })
    >;
typedef $$ChecklistItemsTableTableCreateCompanionBuilder =
    ChecklistItemsTableCompanion Function({
      required String id,
      required String taskId,
      required String content,
      Value<bool> isCompleted,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$ChecklistItemsTableTableUpdateCompanionBuilder =
    ChecklistItemsTableCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<String> content,
      Value<bool> isCompleted,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$ChecklistItemsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ChecklistItemsTableTable,
          ChecklistItemsTableData
        > {
  $$ChecklistItemsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TasksTableTable _taskIdTable(_$AppDatabase db) =>
      db.tasksTable.createAlias(
        $_aliasNameGenerator(db.checklistItemsTable.taskId, db.tasksTable.id),
      );

  $$TasksTableTableProcessedTableManager get taskId {
    final $_column = $_itemColumn<String>('task_id')!;

    final manager = $$TasksTableTableTableManager(
      $_db,
      $_db.tasksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChecklistItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTableTable> {
  $$ChecklistItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TasksTableTableFilterComposer get taskId {
    final $$TasksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableFilterComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTableTable> {
  $$ChecklistItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TasksTableTableOrderingComposer get taskId {
    final $$TasksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableOrderingComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTableTable> {
  $$ChecklistItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TasksTableTableAnnotationComposer get taskId {
    final $$TasksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChecklistItemsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChecklistItemsTableTable,
          ChecklistItemsTableData,
          $$ChecklistItemsTableTableFilterComposer,
          $$ChecklistItemsTableTableOrderingComposer,
          $$ChecklistItemsTableTableAnnotationComposer,
          $$ChecklistItemsTableTableCreateCompanionBuilder,
          $$ChecklistItemsTableTableUpdateCompanionBuilder,
          (ChecklistItemsTableData, $$ChecklistItemsTableTableReferences),
          ChecklistItemsTableData,
          PrefetchHooks Function({bool taskId})
        > {
  $$ChecklistItemsTableTableTableManager(
    _$AppDatabase db,
    $ChecklistItemsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistItemsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ChecklistItemsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistItemsTableCompanion(
                id: id,
                taskId: taskId,
                content: content,
                isCompleted: isCompleted,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required String content,
                Value<bool> isCompleted = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistItemsTableCompanion.insert(
                id: id,
                taskId: taskId,
                content: content,
                isCompleted: isCompleted,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChecklistItemsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (taskId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.taskId,
                                referencedTable:
                                    $$ChecklistItemsTableTableReferences
                                        ._taskIdTable(db),
                                referencedColumn:
                                    $$ChecklistItemsTableTableReferences
                                        ._taskIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChecklistItemsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChecklistItemsTableTable,
      ChecklistItemsTableData,
      $$ChecklistItemsTableTableFilterComposer,
      $$ChecklistItemsTableTableOrderingComposer,
      $$ChecklistItemsTableTableAnnotationComposer,
      $$ChecklistItemsTableTableCreateCompanionBuilder,
      $$ChecklistItemsTableTableUpdateCompanionBuilder,
      (ChecklistItemsTableData, $$ChecklistItemsTableTableReferences),
      ChecklistItemsTableData,
      PrefetchHooks Function({bool taskId})
    >;
typedef $$RemindersTableTableCreateCompanionBuilder =
    RemindersTableCompanion Function({
      required String id,
      required String taskId,
      required String type,
      required DateTime scheduledTime,
      Value<int> leadTimeMinutes,
      Value<String> status,
      required int notificationId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$RemindersTableTableUpdateCompanionBuilder =
    RemindersTableCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<String> type,
      Value<DateTime> scheduledTime,
      Value<int> leadTimeMinutes,
      Value<String> status,
      Value<int> notificationId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$RemindersTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RemindersTableTable,
          RemindersTableData
        > {
  $$RemindersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TasksTableTable _taskIdTable(_$AppDatabase db) =>
      db.tasksTable.createAlias(
        $_aliasNameGenerator(db.remindersTable.taskId, db.tasksTable.id),
      );

  $$TasksTableTableProcessedTableManager get taskId {
    final $_column = $_itemColumn<String>('task_id')!;

    final manager = $$TasksTableTableTableManager(
      $_db,
      $_db.tasksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTableTable> {
  $$RemindersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get leadTimeMinutes => $composableBuilder(
    column: $table.leadTimeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TasksTableTableFilterComposer get taskId {
    final $$TasksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableFilterComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTableTable> {
  $$RemindersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get leadTimeMinutes => $composableBuilder(
    column: $table.leadTimeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TasksTableTableOrderingComposer get taskId {
    final $$TasksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableOrderingComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTableTable> {
  $$RemindersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledTime => $composableBuilder(
    column: $table.scheduledTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get leadTimeMinutes => $composableBuilder(
    column: $table.leadTimeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TasksTableTableAnnotationComposer get taskId {
    final $$TasksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.tasksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTableTable,
          RemindersTableData,
          $$RemindersTableTableFilterComposer,
          $$RemindersTableTableOrderingComposer,
          $$RemindersTableTableAnnotationComposer,
          $$RemindersTableTableCreateCompanionBuilder,
          $$RemindersTableTableUpdateCompanionBuilder,
          (RemindersTableData, $$RemindersTableTableReferences),
          RemindersTableData,
          PrefetchHooks Function({bool taskId})
        > {
  $$RemindersTableTableTableManager(
    _$AppDatabase db,
    $RemindersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<DateTime> scheduledTime = const Value.absent(),
                Value<int> leadTimeMinutes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersTableCompanion(
                id: id,
                taskId: taskId,
                type: type,
                scheduledTime: scheduledTime,
                leadTimeMinutes: leadTimeMinutes,
                status: status,
                notificationId: notificationId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required String type,
                required DateTime scheduledTime,
                Value<int> leadTimeMinutes = const Value.absent(),
                Value<String> status = const Value.absent(),
                required int notificationId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersTableCompanion.insert(
                id: id,
                taskId: taskId,
                type: type,
                scheduledTime: scheduledTime,
                leadTimeMinutes: leadTimeMinutes,
                status: status,
                notificationId: notificationId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (taskId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.taskId,
                                referencedTable: $$RemindersTableTableReferences
                                    ._taskIdTable(db),
                                referencedColumn:
                                    $$RemindersTableTableReferences
                                        ._taskIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTableTable,
      RemindersTableData,
      $$RemindersTableTableFilterComposer,
      $$RemindersTableTableOrderingComposer,
      $$RemindersTableTableAnnotationComposer,
      $$RemindersTableTableCreateCompanionBuilder,
      $$RemindersTableTableUpdateCompanionBuilder,
      (RemindersTableData, $$RemindersTableTableReferences),
      RemindersTableData,
      PrefetchHooks Function({bool taskId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ContextsTableTableTableManager get contextsTable =>
      $$ContextsTableTableTableManager(_db, _db.contextsTable);
  $$TasksTableTableTableManager get tasksTable =>
      $$TasksTableTableTableManager(_db, _db.tasksTable);
  $$ChecklistItemsTableTableTableManager get checklistItemsTable =>
      $$ChecklistItemsTableTableTableManager(_db, _db.checklistItemsTable);
  $$RemindersTableTableTableManager get remindersTable =>
      $$RemindersTableTableTableManager(_db, _db.remindersTable);
}
