import marshal, chronicles, httpclient, json

type
  GitHubUser = object
    name: string

proc get_user*(name: string): string =
    info "get user pinged"

    var client = newHttpClient()
    var response = client.request("https://api.github.com/users/atkinsonbg/repos")
    var jsonBody = parseJson(response.body)
    echo $(jsonBody[0]["name"])

    var github_user = GitHubUser(name: name)
    return $$github_user