CSLP.Workboard.Models.Screen = Backbone.Model.extend({

    defaults : {
        idActivity: 0,
        idTeamwork : 0,
        nusers : 0,
        share : [],
    },

    initialize : function() {
        this.set('idActivity',window.actvityId);
        this.set('idTeamwork', window.teamworkid);
        this.set('nusers', window.usercounts);
    },
    
    update : function(data){
        this.set('share', data);
    }
});