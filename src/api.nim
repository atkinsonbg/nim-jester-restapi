import jester
import handlers/[health, github]
import utils/[response]


router myrouter:
  get "/health-check":
    json_response(Http200, health.get_health())

  get "/github/@name":
    json_response(Http200, github.get_user(@"name"))

proc main() =
  let settings = newSettings(port=Port(5000))
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()