$(document).ready(function(){

    window.currentCourse = undefined;

    //Collections
    window.collections.courses = new CSLP.Exercises.Collections.Courses();

    //Views
    window.modal = new CSLP.Exercises.Views.Modal({
        el : $('#edit-modal')
    });

    if(window.courses.length >0){
        $('#courses-container').show();
        window.collections.courses.add(window.courses);
        if(window.students !== undefined){
            window.collections.students = new CSLP.Exercises.Collections.Students();
            window.collections.students.add(window.students);
        }

        window.collections.courses.first().view.$el.trigger('click');
    }else{
        $('#no-courses').show();
    }



    $('#btn-add').on('click',function(){
        window.modal.setModel(new CSLP.Exercises.Models.Exercise);
        window.modal.toggle();
    });

});

setCurrentCourse = function(model){
    if(window.currentCourse !== model){
        window.currentCourse = model;

        $('.exercise').hide();
        window.currentCourse.showProblems();

        if(window.collections.students !== undefined){
            //Necesitamos que las filas de profesores se actualicen con la info del nuevo curso
            window.collections.students.forEach(function(model) {
                model.trigger('change');
            });
        }
    }
};