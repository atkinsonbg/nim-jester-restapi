import unittest, osproc, json, ../src/handlers/[github]

suite "description for this stuff":
  echo "suite setup: run once before the tests"
  
  setup:
    echo "run before each test"
  
  teardown:
    discard execCmd("rm -rf tests/test_api")
    echo "successfully removed test binary!"
  
  test "GitHub user creation":
    echo "in github user test"
    let jsonNode = parseJson("""[{"name": "repo1",},{"name": "repo2",}]""")
    let user = github.build_github_user("atkinsonbg", jsonNode)
    check(user.name == "atkinsonbg")
    check(len(user.repos) == 2)
    check(user.repos[0] == "repo1")
  
  echo "suite teardown: run once after the tests"