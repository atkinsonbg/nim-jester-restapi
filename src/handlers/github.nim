import marshal, chronicles, httpclient, json, strformat

type
  GitHubUser = object
    name: string
    repos: seq[string]

proc get_user*(name: string): string =
    info "get user pinged"

    var client = newHttpClient()
    var response = client.request(fmt"https://api.github.com/users/{name}/repos")
    var jsonBody = parseJson(response.body)

    var github_user = GitHubUser(name: name)

    for repo in jsonBody:
        github_user.repos.add(repo["name"].getStr())

    return $$github_user