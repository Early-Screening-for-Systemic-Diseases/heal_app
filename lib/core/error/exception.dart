class VektuAppExceptions implements Exception {
  final String message;
  const VektuAppExceptions(this.message);
}

class RemoteException extends VektuAppExceptions {
  const RemoteException(super.message);
}

class LocalException extends VektuAppExceptions {
  const LocalException(super.message);
}
