import Vapor
import PennyConnector
import Mint
import Penny

extension LinkRequestHandler {
    static func handle(_ req: Request) throws -> Future<AccountLinkRequest> {
        let ghlr = try req.content.decode(GitHubLinkRequest.self)
        return ghlr.flatMap { ghlr in
            let handler = LinkRequestHandler(worker: req, ghlr: ghlr)
            return try handler.handle()
        }
    }
}
