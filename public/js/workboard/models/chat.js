CSLP.Workboard.Models.Chat = Backbone.Model.extend({

    defaults : {
        idActivity : 0,
        idTeamwork : 0,
        nusers : 0,
        messages: [],
    },

    initialize : function() {
        this.set('idActivity',window.activitiId);
        this.set('idTeamwork', window.teamworkid);
        this.set('nusers', window.usercount);
    },
    update : function(){
        var self = this;
        $.get(basePath + '/fmessages/' + this.get('idTeamwork'), function(response) {
            if(response != self.get('messages')){
                self.set('messages', response || []);
                console.log(response);
                window.chatView.render();
            }    
        });
    },

    sendMessage :function(message, rmessage){
         if(rmessage == null)
            rmessage = {user_id : null, message : null, username : null, id : null};
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
        this.set('message',arrayMessage);
    }

});