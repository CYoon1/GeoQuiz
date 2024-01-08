//
//  FBDataService.swift
//  GeoQuiz
//
//  Created by Christopher Yoon on 1/7/24.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

protocol FBIdentifiable : Identifiable & Codable {
    var id : String? { get set }
    init()
}

class FBDataService<T : FBIdentifiable>: ObservableObject, DataService {
    @Published var items: [T] = []
    private let path : String
    private let store = Firestore.firestore()
    
    init(path: String){
        self.path = path
        addSnapShotListenter()
    }
    
    func getData() -> AnyPublisher<[T], Error> {
        $items.tryMap{$0}.eraseToAnyPublisher()
    }

    func add(_ item: T){
        do{
            _ = try store.collection(path).addDocument(from: item)
        } catch{
            fatalError("Adding an item failed")
        }
        
    }
    func delete(_ item: T){
        guard let documentID = item.id else { return }
        store.collection(path).document(documentID).delete{ error in
            if let error = error {
                print("Unable to remove fbmask: \(error.localizedDescription)")
            }
        }
    }
    func delete(indexSet: IndexSet) {
        var itemsToDelete : [T] = []
        indexSet.forEach { index in
            itemsToDelete.append(items[index])
        }
        indexSet.forEach { index in
            delete(items[index])
        }
    }
    
    func update(_ item: T){
        guard let documentID = item.id else { return }
        do{
            try store.collection(path).document(documentID).setData(from: item)

        } catch {
            fatalError("Updating item failed")
        }
    }
    
    private func addSnapShotListenter(){
        store.collection(path).addSnapshotListener { (snapshot, error) in
            if let error  = error{
                print(error)
                return
            }
            self.items = snapshot?.documents.compactMap{
                try? $0.data(as: T.self)
            } ?? []
        }
    }
}
