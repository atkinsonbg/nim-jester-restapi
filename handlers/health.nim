import marshal

type
  HealthCheck = object
    health: string

proc get_health*(): string =
    var health_check = HealthCheck(health: "OK")
    return $$health_check