const cds = require ('@sap/cds');

class UserService extends cds.ApplicationService{
    async init(){
        
        this.on("createComment", async req => {
            const receiver = req.params.find(o => { return o.hasOwnProperty("emailAddress") }).emailAddress
            const data = {
                content: req.data.content,
                value: req.data.rating,
                Receiver_emailAddress: receiver,
                Sender_emailAddress: req.req.user.id
            }
            
        
            const db = this.transaction(req);
            let result = await this.post(this.entities.Comments).entries(data);
        })

        this.after("READ","Comments", async (comments) => {
            for(let each of comments){
                if(each.author === null && each.Sender_emailAddress){
                    each.author = each.Sender_emailAddress                    
                }else if(each.author === null){
                    let result = await this.get(this.entities.Comments).where({ID: each.ID})
                    each.author = result[0].Sender_emailAddress
                }
            }
        })

        return super.init();
    }
}

module.exports = { UserService }