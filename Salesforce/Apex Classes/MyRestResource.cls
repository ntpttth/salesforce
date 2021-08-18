@RestResource(urlMapping='/Contact/*')
global class MyRestResource {

    @HttpPost
    global static string doPost(List<Contact> contacts) {
        
        List<string> messages = new List<string>();
        List<Contact> contactsInDb = [SELECT Id FROM Contact 
                                      WHERE Id IN :contacts];
        for (Contact contact : contacts){
            Contact contactToUpdate = null;
            
            for (Contact contactInDb : contactsInDb) {
                if (contact.Id == contactInDb.Id) {
                    contactToUpdate = contactInDb;
                    break;
                }
            }
            
            if (contactToUpdate == null) {
                messages.add('Contact with id ' + contact.Id + ' doesnt exist in database');
                continue;
            }
            
            contactToUpdate.Phone = contact.Phone;
            contactToUpdate.Email = contact.Email;
        }
        
        update contactsInDb;
        
        if (messages.size() == 0) {
            messages.add('Successful');
        }
        
        return String.join(messages, ', ');
    }
}