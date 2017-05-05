//
//  Copyright (c) 2017 Touch Instinct
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the Software), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Alamofire
import LeadKit
import ObjectMapper
import RxSwift

open class DefaultNetworkService: NetworkService {

    static let retryLimit = 3

    open class var baseUrl: String {
        fatalError("You should override this var: baseUrl")
    }

    open class var defaultTimeoutInterval: TimeInterval {
        return 20.0
    }

    public override init(sessionManager: SessionManager) {
        super.init(sessionManager: sessionManager)

        #if os(iOS) && !LEADKIT_EXTENSION_TARGET
            bindActivityIndicator()
        #endif
    }

    // MARK: - Default Values

    open class var serverTrustPolicies: [String: ServerTrustPolicy] {
        return [
            baseUrl: .disableEvaluation
        ]
    }

    open class var configuration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = defaultTimeoutInterval

        return configuration
    }

    open class var sessionManager: SessionManager {
        let sessionManager = SessionManager(configuration: configuration,
                                            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        return sessionManager
    }

}
