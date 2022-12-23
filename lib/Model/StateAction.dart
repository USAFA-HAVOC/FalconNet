import 'package:falcon_net/Model/UserNotification.dart';

class StateAction {
  final ActionType? type;
  final Enum? subject;
  final dynamic value;

  const StateAction.editInfo(this.subject, this.value) : type = ActionType.editInfo;

  const StateAction.dismissAll() :
        type = ActionType.dismissAll,
        subject = null,
        value = null;

  const StateAction.dismiss({required UserNotification notification}) :
        type = ActionType.dismiss,
        subject = null,
        value = notification;

  const StateAction.setSetting({required Enum property, required this.value}) :
        type = ActionType.editSetting,
        subject = property;

}

enum ActionType {
  editInfo,
  dismissAll,
  dismiss,
  editSetting,
}