struct Pokemon: Decodable {
    let name: String
    let image: String
    let apiTypes: [TypeInfo]
    let apiGeneration: Int

    struct TypeInfo: Decodable {
        let name: String
    }
}
