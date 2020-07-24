import marshal, chronicles

type
  HealthCheck = object
    health: string

proc get_health*(): string =
    info "health check pinged"
    var health_check = HealthCheck(health: "OK")
    return $$health_check