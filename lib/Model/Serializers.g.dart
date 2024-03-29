// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AccountabilityEvent.serializer)
      ..add(Attendee.serializer)
      ..add(CadetAccountability.serializer)
      ..add(CadetLeave.serializer)
      ..add(CadetLeaveTransportMethod.serializer)
      ..add(CadetPass.serializer)
      ..add(CadetPassAllocation.serializer)
      ..add(DIRequest.serializer)
      ..add(EventExcusal.serializer)
      ..add(EventList.serializer)
      ..add(Excusal.serializer)
      ..add(FormDataList.serializer)
      ..add(FormList.serializer)
      ..add(FormOneData.serializer)
      ..add(FormSummary.serializer)
      ..add(Grade.serializer)
      ..add(GradeSubmission.serializer)
      ..add(IndividualPassStatus.serializer)
      ..add(IndividualStatusRequest.serializer)
      ..add(InitialData.serializer)
      ..add(PassHistoryModel.serializer)
      ..add(PassStatusRequest.serializer)
      ..add(RecurringExcusal.serializer)
      ..add(RoleRequest.serializer)
      ..add(SchedulingEvent.serializer)
      ..add(SignRequest.serializer)
      ..add(SquadronAssignRequest.serializer)
      ..add(StanEvalUser.serializer)
      ..add(StringRequest.serializer)
      ..add(TimedRole.serializer)
      ..add(Unit.serializer)
      ..add(UnitAssignRequest.serializer)
      ..add(UnitData.serializer)
      ..add(UnitDataRequest.serializer)
      ..add(UnitGrades.serializer)
      ..add(UnitList.serializer)
      ..add(UnitManagementThing.serializer)
      ..add(UnitOrder.serializer)
      ..add(UnitSummary.serializer)
      ..add(User.serializer)
      ..add(UserDelegates.serializer)
      ..add(UserDelegatesList.serializer)
      ..add(UserEvent.serializer)
      ..add(UserEventExcusal.serializer)
      ..add(UserEventStatus.serializer)
      ..add(UserGrades.serializer)
      ..add(UserList.serializer)
      ..add(UserNotification.serializer)
      ..add(UserPersonalInfo.serializer)
      ..add(UserSettings.serializer)
      ..add(UserSummary.serializer)
      ..add(UserSummaryList.serializer)
      ..add(WingData.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AccountabilityEvent)]),
          () => new ListBuilder<AccountabilityEvent>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CadetPass)]),
          () => new ListBuilder<CadetPass>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CadetPass)]),
          () => new ListBuilder<CadetPass>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserEvent)]),
          () => new ListBuilder<UserEvent>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(EventExcusal)]),
          () => new ListBuilder<EventExcusal>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(RecurringExcusal)]),
          () => new ListBuilder<RecurringExcusal>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(BuiltList, const [const FullType.nullable(DateTime)])
          ]),
          () => new MapBuilder<String, BuiltList<DateTime?>>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FormOneData)]),
          () => new ListBuilder<FormOneData>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FormSummary)]),
          () => new ListBuilder<FormSummary>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Grade)]),
          () => new ListBuilder<Grade>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Grade)]),
          () => new ListBuilder<Grade>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Grade)]),
          () => new ListBuilder<Grade>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(IndividualPassStatus)]),
          () => new ListBuilder<IndividualPassStatus>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(StanEvalUser)]),
          () => new ListBuilder<StanEvalUser>())
      ..addBuilderFactory(
          const FullType(BuiltMap,
              const [const FullType(String), const FullType(UserGrades)]),
          () => new MapBuilder<String, UserGrades>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TimedRole)]),
          () => new ListBuilder<TimedRole>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TimedRole)]),
          () => new ListBuilder<TimedRole>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TimedRole)]),
          () => new ListBuilder<TimedRole>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Unit)]),
          () => new ListBuilder<Unit>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UnitSummary)]),
          () => new ListBuilder<UnitSummary>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(User)]),
          () => new ListBuilder<User>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserDelegates)]),
          () => new ListBuilder<UserDelegates>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserSummary)]),
          () => new ListBuilder<UserSummary>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserSummary)]),
          () => new ListBuilder<UserSummary>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserSummary)]),
          () => new ListBuilder<UserSummary>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
