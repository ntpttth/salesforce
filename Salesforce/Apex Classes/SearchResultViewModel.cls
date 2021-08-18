public class SearchResultViewModel {
    public String RecordName {get;set;}
    public String RecordType {get;set;}
    public string Id {get;set;}
    
    public SearchResultViewModel(string recordName, string recordType, string id){
        this.RecordName = recordName;
        this.RecordType = recordType;
        this.Id = id;
    }
}