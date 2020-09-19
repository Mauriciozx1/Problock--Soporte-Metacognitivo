CSLP.Exercises.Models.Exercise = Backbone.Model.extend({

    defaults : {
        name : '',
        description : '',
        open_at : '',
        close_at : '',
        avgScore : 0
    },

    initialize : function() {

    },

    save : function() {

        var self = this;
        $.post(basePath + '/maker/saveproblem', {
            id : this.get('id') || null,
            course_id : window.currentCourse.get('id'),
            name : this.get('name'),
            description : this.get('description'),
            open_at : this.get('open_at'),
            close_at : this.get('close_at')
        }, function(response) {

            if(!self.get('id')){
                self.set('id',response);
                window.currentCourse.addExercise(self);
                self.view.attach();
            }
        });
    },

    delete : function() {

        var self = this;
        $.post(basePath + '/maker/deleteproblem', {
            id : this.get('id')
        }, function() {
            self.id = undefined;
            self.destroy();
        });
    }
});