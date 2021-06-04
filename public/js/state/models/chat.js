CSLP.State.Models.Chat = Backbone.Model.extend({

    defaults : {
        idProblem : 0,
        messages: [],
    },

    initialize : function() {
        this.set('idProblem',window.idProblem);
    },
    update : function(){
        /*
        var self = this;
        $.get(basePath + '/fmessages/' + this.get('idTeamwork'), function(response) {
            if(response != self.get('messages')){
                self.set('messages', response || []);
                console.log(response);
                window.chatView.render();
            }    
        });*/
    },

    sendMessage : function(student, message){
        var messages = this.get('messages');
        var variable = false;
        if(message.rmessage == null){
            message.rmessage = {user_id : null, message : null, username : null, id : null};
        }
        if(messages.length > 0){
            messages.forEach(element => {
                if(element == student){
                    element.chat.push(message);
                    variable = true;
                }
            });
        }
        if(variable == false){
            var data = {student : student, chat : message};
            messages.push(data);
        }
        
        

        /*
        $.post(basePath +'/smessages', {
            
            teamworkid : window.teamworkid,
            message : message,
            ruserid :  rmessage.user_id || null,
            rmessage : rmessage.message|| null,
            rusername : rmessage.username || null,
            rid : rmessage.id || null
        })
        var arrayMessage= this.get('messages');
        arrayMessage.push(message);
        this.set('message',arrayMessage);*/
    }

});