import 'package:falcon_net/Model/UserNotification.dart';

class StateAction {
  final ActionType? type;
  final dynamic subject;
  final dynamic value;

  const StateAction.editInfo(this.subject, this.value) : type = ActionType.editInfo;

  const StateAction.dismissAll() :
        type = ActionType.dismissAll,
        subject = null,
        value = null;

  const StateAction.dismiss({required UserNotification notification}) :
        type = ActionType.dismiss,
        subject = notification,
        value = null;

  const StateAction.setSetting({required String id, required this.value}) :
        type = ActionType.editSetting,
        subject = id;

}

enum ActionType {
  editInfo,
  dismissAll,
  dismiss,
  editSetting,
}