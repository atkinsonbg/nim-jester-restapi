template json_response*(code, message: untyped): untyped =
  mixin resp
  resp code, @{"Content-Type": "application/json"}, message