CSLP.Exercises.Models.Student = Backbone.Model.extend({
    defaults : {
        id : undefined,
        name : '',
        flastname : '',
        mlastname : '',
        email : '',
        //Array con el id de los cursos a los que esta enlazado
        courses : undefined
    },

    view : undefined,

    initialize : function() {

    },


    link : function(courseId){

        $.post(basePath + '/courses/link', {
            user_id : this.get('id'),
            course_id : courseId
        }, function() {

        });

        //Cambio optimista
        if(this.get('courses') === undefined){
            this.set('courses', [courseId])
        }else {
            this.get('courses').push(courseId);
            this.trigger('change');
        }
    },


    //Solicita el enlace del profesor con un curso determinado
    unlink : function(courseId) {

        $.post(basePath + '/courses/unlink', {
            user_id : this.get('id'),
            course_id : courseId
        }, function() {

        });

        //Cambio optimista
        var index = this.get('courses').indexOf(courseId);
        delete this.get('courses')[index];
        this.trigger('change');
    }

});