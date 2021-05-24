CSLP.Workboard.Models.Vote = Backbone.Model.extend({
    defaults : {
        id : 0,
        teamworkid : 0,
        activityid : 0,
        nusers : 0,
        vote :[],
        status : false,
        statusFinish: false
    },
    initialize : function() {
        this.set('nusers', window.usercount);
        this.set('teamworkid',window.teamworkid);
        this.set('activityid', window.activitiId);
        
    },
    update : function(vote){ 
        var voteArray = this.get('vote');
        voteArray.push(vote);
        this.set('vote', voteArray);
        console.log('Update Model');
        console.log(voteArray);
        if(voteArray.length == window.usercount){
            this.set('status',true);
            var yes = voteArray.filter(v => v.methode != 'no');
            var no = voteArray.filter(v => v.methode != 'yes');
            $('.loader-vote').fadeOut();
            if(yes.length > no.length){
                CSLP.message.success('El termino de la actividad fue aceptada.');
                this.set('statusFinish', true);
                $('.btn-finish-vote-accept').fadeIn();
            }else{
                CSLP.message.error('El termino de la actividad fue rechazada.');
                $('.btn-finish-vote-cancel').fadeIn();
            }
            
        }     
    },
    clear : function(){
        this.set('vote',[]);
        
        
    }
    
    });
