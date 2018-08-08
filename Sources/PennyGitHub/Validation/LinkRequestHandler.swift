import Vapor
import PennyConnector
import Mint
import Penny

struct LinkRequestHandler {
    let worker: Container
    let ghlr: GitHubLinkRequest

    func handle() throws -> Future<AccountLinkRequest> {
        let user = try associatedUser()
        let issue = try postValidationIssue()
        return user.and(issue).flatMap(handle)
    }

    private func postValidationIssue() throws -> Future<Issue> {
        return try worker.github.postValidationIssue(ghlr)
    }

    private func associatedUser() throws -> Future<User> {
        return try worker.github.user(login: ghlr.login)
    }

    private func handle(user: User, issue: Issue) throws -> Future<AccountLinkRequest> {
        let link = AccountLinkRequest(
            initiationSource: ghlr.source,
            initiationId: ghlr.sourceId,
            requestedSource: "github",
            requestedId: user.id.description,
            reference: issue.number.description
        )
        return try worker.penny.linkRequests.add(link)
    }
}
