CSLP.Exercises.Models.Exercise = Backbone.Model.extend({

    defaults : {
        name : '',
        description : '',
        open_at : '',
        close_at : '',
        avgScore : 0,
        teamworks : 0,
        type_problem : ''
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
            close_at : this.get('close_at'),
            teamworks : this.get('teamworks'),
            type_problem : this.get('type_problem')
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