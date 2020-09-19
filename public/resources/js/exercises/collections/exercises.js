CSLP.Exercises.Collections.Exercises = Backbone.Collection.extend({

    model : CSLP.Exercises.Models.Exercise,

    initialize : function(){
        this.on('add', function(model){
            model.view = new CSLP.Exercises.Views.Exercise({
                model : model
            });
        });
    }
});