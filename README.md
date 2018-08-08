## Penny GitHub Connector

## Features

- Receive Organization WebHooks
- Receive Validation WebHooks

- Respond to GitHub Comments
- Respond to Merged PullRequests

## API

### Authorization

Include the header field `Authorization` with `Bearer \(YOUR_TOKEN_HERE)`

```
Authorization: Bearer abz9e-wxlx98e-sssa
```

### connect-user

```
githubLogin: penny-coin-test // github username to connect
sourceUsername: penny // the name of the username requesting the connect
source: source // the source from which the request was made
callbackUrl: 
```

Use this endpoint to request a user's GitHub Link

