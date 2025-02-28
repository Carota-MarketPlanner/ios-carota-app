//
//  CloudService.swift
//  Carota
//
//  Created by Elias Ferreira on 27/02/25.
//

import CarotaService

public class CloudService: CARequestProvider {
    private let baseUrl = "https://carota-back-dev.onrender.com"
    private let client = CSCloudClient.shared
    
    func make<Response>(request: CARequest, completion: @escaping (CAResponse<Response>) -> Void) where Response : Decodable {
        setAuthorizationIfNeeded()
        client.request(
            url: getURL(from: request),
            method: request.method.csMethod,
            body: getBody(object: request.body)
        ) { response in
            switch response {
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode(Response.self, from: data)
                    completion(.init(object: object))
                } catch {
                    completion(.init(error: error))
                }
                
            case .failure(let error):
                completion(.init(error: error))
            }
        }
    }
    
    private func setAuthorizationIfNeeded() {
        client.setAuthorization(.bearer(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3NDA3NjAyNzAsImV4cCI6MTc0MDc2Mzg3MCwic3ViIjoiYzdiNzRkMGMtZWQ0NC00ZDlmLWJmOGYtODRiMzRiMWViZTcxIn0.oCGllxSFV2S7VXpPT64vHPVVJjD2CBd9AVPv-7JU63A"))
    }
    
    private func getURL(from request: CARequest) -> String {
        let params = request.parameters ?? [:]
        return baseUrl + "/" + request.endpoint + params.toRouteParams()
    }
    
    private func getBody(object: Encodable?) -> HTTPBody? {
        guard let object else { return nil }
        return .json(object: object)
    }
}
