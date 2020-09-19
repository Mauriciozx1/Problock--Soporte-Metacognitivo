CSLP.Maker.Collections.Activities = Backbone.Collection.extend({

    name : 'activities',

    model :  CSLP.Maker.Models.Activity,

    view : undefined,

    initialize : function(){
        var self = this;
        this.on('add',function(model){
            model.view = new CSLP.Maker.Views.ActivityRow({
                model : model
            });

            self.parent.view.attachActivity(model.view.$el);
        });
    }

});