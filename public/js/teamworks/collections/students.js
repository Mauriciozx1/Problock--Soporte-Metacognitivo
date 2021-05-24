CSLP.Teamworks.Collections.Students = Backbone.Collection.extend({
    name : 'students',
    model : CSLP.Teamworks.Models.Student,
    view : undefined,

    initialize : function() {
        var self = this;
        this.on('add', function(model){
            model.view = new CSLP.Teamworks.Views.Student({
                model : model
            });
            self.parent.view.attachStudent(model.view.$el);
        });
    }

});