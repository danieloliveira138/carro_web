class ApiResponse<T> {
  bool status;
  String msg;
  T result;

  ApiResponse.success(this.result) {
    status = true;
  }

  ApiResponse.error(this.msg) {
    status = false;
  }
}