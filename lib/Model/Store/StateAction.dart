import 'package:falcon_net/Model/Data/UserNotification.dart';
import 'package:flutter/cupertino.dart';
import '../Data/FormOne.dart';
import '../Data/Leave.dart';
import '../Data/Pass.dart';

///Class for actions that can be dispatched against the data store
///Each constructor represents a type of action
class StateAction {
  final ActionType? type;
  final Enum? subject;
  final dynamic value;

  const StateAction.editInfo(this.subject, this.value) :
        type = ActionType.editInfo;

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

  const StateAction.openPass(Pass pass) :
      type = ActionType.openPass,
      subject = null,
      value = pass;

  const StateAction.closePass() :
        type = ActionType.closePass,
        subject = null,
        value = null;

  const StateAction.updatePass(Pass pass) :
        type = ActionType.updatePass,
        subject = null,
        value = pass;

  const StateAction.setLeave(Leave leave) :
        type = ActionType.setLeave,
        subject = null,
        value = leave;

  const StateAction.clearLeave() :
      type = ActionType.clearLeave,
      subject = null,
      value = null;

  const StateAction.signDI() :
        type = ActionType.signDI,
        subject = null,
        value = null;

  const StateAction.signForm(FormOne form) :
        type = ActionType.signForm,
        subject = null,
        value = form;
}

enum ActionType {
  editInfo,
  dismissAll,
  dismiss,
  editSetting,
  openPass,
  closePass,
  updatePass,
  setLeave,
  clearLeave,
  signDI,
  signForm,
}