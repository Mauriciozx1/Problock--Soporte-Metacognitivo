CSLP.Exercises.Collections.Students = Backbone.Collection.extend({
    model : CSLP.Exercises.Models.Student,

    initialize : function() {
        this.on('add',function(model) {
            model.view = new CSLP.Exercises.Views.StudentLinkRow({
                model : model
            });
        })
    },

});