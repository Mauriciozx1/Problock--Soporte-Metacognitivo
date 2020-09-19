CSLP.Admin.Collections.Teachers = Backbone.Collection.extend({
    model : CSLP.Admin.Models.Teacher,

    initialize : function() {
        this.on('add',function(model) {
            model.view = new CSLP.Admin.Views.TeacherRow({
                model : model
            });

            new CSLP.Admin.Views.TeacherLinkRow({
                model : model
            });
        })
    },

});