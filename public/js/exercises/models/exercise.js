CSLP.Exercises.Models.Exercise = Backbone.Model.extend({

    defaults : {
        name : '',
        description : '',
        open_at : '0000-00-00 00:00:00',
        close_at : '0000-00-00 00:00:00',
        avgScore : 0,
        teamworks : '',
        type_problem : '',
        n_student : 0,
        p_autoadd : ''
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
            type_problem : this.get('type_problem'),
            p_autoadd :this.get('p_autoadd')
        },
         function(response) {

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
    },
  
});