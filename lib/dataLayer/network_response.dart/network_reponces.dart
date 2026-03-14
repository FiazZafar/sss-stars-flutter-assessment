class ApiResponces<T> {
  T? data;
  String? message;
  ResponseStatus? status;

  ApiResponces({this.data, this.message, this.status});
  ApiResponces.loading() : status = ResponseStatus.loading;
  ApiResponces.success(this.data) : status = ResponseStatus.success;
  ApiResponces.error(this.message) : status = ResponseStatus.failed;
}

enum ResponseStatus {
  loading,success,failed
}