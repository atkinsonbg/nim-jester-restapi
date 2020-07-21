import jester
import handlers/[health]
import utils/[response]

router myrouter:
  get "/health-check":
    json_response(Http200, get_health())

  get "/hello":
    resp """{"hello": "world"}"""

proc main() =
  let settings = newSettings(port=Port(5000))
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()