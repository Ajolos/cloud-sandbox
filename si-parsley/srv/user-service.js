const cds = require('@sap/cds');
const fs = require('fs');
const util = require('util');

class UserService extends cds.ApplicationService {
    async init() {

        const log_file = fs.createWriteStream(__dirname + '/debug.log', { flags: 'w' });

        this.on("createComment", async req => {
            const receiver = req.params.find(o => { return o.hasOwnProperty("emailAddress") }).emailAddress
            const data = {
                content: req.data.content,
                value: req.data.rating,
                Receiver_emailAddress: receiver,
                Sender_emailAddress: req.req.user.id
            }
            // log_file.write(util.format(req) + '\n');
            const db = this.transaction(req);
            let result = await this.post(this.entities.Comments).entries(data);
        })

        this.after("READ", "Employees", (employees, req) => {
            let loggedUser = "", request;
            try{
                if (req.hasOwnProperty("req")) {
                    request = req.req;
                } else if (req.hasOwnProperty("_")){
                    request = req._.req;
                } else {
                    log_file.write("No req!");
                }
                if(request){
                    if(request.hasOwnProperty("tokenInfo")){
                        loggedUser = request.tokenInfo.getPayload().user_name;
                    }else{
                        log_file.write("No tokenInfo");
                    }
                }
            }catch(e){
                log_file.write(util.format(e));
            }
            if (employees instanceof Array) {
                for (let each of employees) {
                    each.IsSelf = (each.emailAddress === loggedUser);
                }
            } else {
                employees.IsSelf = (employees.emailAddress === loggedUser);
            }

        })

        this.after("READ", "Comments", async (comments) => {
            for (let each of comments) {
                if (each.author === null && each.Sender_emailAddress) {
                    each.author = each.Sender_emailAddress
                } else if (each.author === null) {
                    let result = await this.get(this.entities.Comments).where({ ID: each.ID })
                    each.author = result[0].Sender_emailAddress
                }
            }
        })

        return super.init();
    }
}

module.exports = { UserService }