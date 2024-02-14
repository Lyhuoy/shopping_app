// ignore_for_file: constant_identifier_names

enum InvCountTrxFlag { Pending, Inprocess, PendingRecount, ProcessRecount }

extension IsInvCountTrxFlag on InvCountTrxFlag {
  bool get isPending => this == InvCountTrxFlag.Pending;
  bool get isInprocess => this == InvCountTrxFlag.Inprocess;
  bool get isPendingRecount => this == InvCountTrxFlag.PendingRecount;
  bool get isProcessRecount => this == InvCountTrxFlag.ProcessRecount;
}