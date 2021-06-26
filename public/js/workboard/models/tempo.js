CSLP.Workboard.Models.Tempo = Backbone.Model.extend({

    defaults : {
        id : 0,
        id_afk: 0,
        seconds : 0,
        minutes : 10,
        pivotesg : false,
        pivotemn : false,
    },

    initialize : function() {
        
    },
    
    update : function(sg, mn){
        this.set('seconds', sg);
        this.set('minutes', mn);

    },
    reset : function(){
        var self = this;
        self.set('id', 0);
        self.set('seconds', 0);
        self.set('minutes', 10);
        self.set('pivotesg', false);
        self.set('pivotemn', false);
    }
});