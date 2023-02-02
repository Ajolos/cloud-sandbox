const cds = require ('@sap/cds');

class UserService extends cds.ApplicationService{
    init(){
        
        this.on("createComment", async req => {
            //req.params contains entity (context) keys
            //req.data contains values sent
            console.log(req.user);

        })

        return super.init();
    }
}

module.exports = { UserService }