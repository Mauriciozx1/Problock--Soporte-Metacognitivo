CSLP.Admin.Collections.Courses = Backbone.Collection.extend({
    model : CSLP.Admin.Models.Course,

    initialize : function(){
        this.on('add', function(model) {
            model.view = new CSLP.Admin.Views.CourseRow({
                model : model
            });
        })
    }

});