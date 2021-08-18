public class SearchController {
    public String keyword {get;set;}
    public List<SearchResultViewModel> result {get;set;}
    
    public SearchController() {}
    
    public void search(){
        result = new List<SearchResultViewModel>();
        string queryClause = keyword + '%';
        
        List<Account> accounts = [SELECT Name FROM Account WHERE (Name like :queryClause)];
        List<Contact> contacts = [SELECT Name FROM Contact WHERE (Name like :queryClause)];
        
        for (Account account : accounts) {
            System.debug(account.Name);
            result.add(new SearchResultViewModel(account.Name, 'Account', account.Id));
        }
        for (Contact contact : contacts) {
            result.add(new SearchResultViewModel(contact.Name, 'Contact', contact.Id));
        }
    }
}