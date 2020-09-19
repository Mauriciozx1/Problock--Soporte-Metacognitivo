CSLP.Workboard.Collections.Activities = Backbone.Collection.extend({

    name : 'activities',

    model :  CSLP.Workboard.Models.Activity,

    view : undefined,

    parent : undefined,

    initialize : function(){

        var self = this;
        this.on('add', function(model){

            model.on('change',function(){
                self.trigger('change');
            });

        });
    }

});