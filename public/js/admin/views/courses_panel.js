CSLP.Admin.Views.CoursesPanel = Backbone.View.extend({

    events : {
        'click #deleteCourse' : 'deleteCourse',
        'click #saveCourse' : 'saveCourse',
        'click #addCourse' : 'addCourse'
    },

    course : undefined,

    initialize : function() {

    },

    render : function() {

    },

    changeModel : function(model) {

        if(model !== undefined) {
            if(model !== this.course) {
                this.course = model;

                //Necesitamos que las filas de profesores se actualicen con la info del nuevo curso
                window.collections.teachers.forEach(function(model) {
                    model.trigger('change');
                });

                //Estableciendo los valores del curso en el formulario por si se desean editar
                this.$('#frm-code').val(model.get('code'));
                this.$('#frm-course-name').val(model.get('name'));
                //Mostrar el boton para eliminar el curso
                this.$('#deleteCourse').show();
                //Mostrar los profesores
                this.$('.table-container').show();

                //Cambia el label del boton
                this.$('#saveCourse').html('Guardar');
            }
        } else {
            this.course = model;
            //Esconder el boton de eliminar curso y la tabla de profesores
            this.$('#deleteCourse').hide();
            this.$('.table-container').hide();

            //Cambia el label del boton
            this.$('#saveCourse').html('Agregar Curso');

        }
    },

    clean : function(){
        this.changeModel(undefined);
        this.$('#frm-code').val('');
        this.$('#frm-course-name').val('');
        $('.course-row.active').removeClass('active');
    },

    /**
     * EVENTS
     */

    addCourse : function() {
        this.clean();
    },

    saveCourse : function() {
        var data = {
            code : this.$('#frm-code').val(),
            name : this.$('#frm-course-name').val()
        };

        if(this.course === undefined) {
            var course = new CSLP.Admin.Models.Course(data);
            course.save();

        } else {
            //editando un curso existente
            this.course.set('code', data.code);
            this.course.set('name', data.name);
            this.course.save();
        }

    },

    deleteCourse : function() {
        if(this.course !== undefined) {
            var response = confirm('¿Seguro que desea eliminar este curso?');
            if(response) {
                this.course.delete();
                this.clean();
            }
        }
    }

});