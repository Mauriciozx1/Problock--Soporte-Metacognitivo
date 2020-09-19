CSLP.Exercises.Views.StudentLinkRow = Backbone.View.extend({

    className : 'student-row',

    tagName : 'tr',

    events : {
        'click .btn-link' : 'toggleLink',
        'click .btn-unlink' : 'toggleLink'
    },

    linked : false,

    initialize : function() {
        this.template = _.template($('#student-link-row-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);

        this.render();
        this.$el.appendTo('#students-link-tbody');

    },

    render : function() {
        var data = this.model.toJSON();

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
        this.setButtonState();
    },

    //Establece si el boton debe estar en "Enlazar" o "Desenlazar"
    setButtonState : function() {
        this.linked = this.model.get('courses') !== undefined && this.model.get('courses').length > 0 && window.currentCourse !== undefined && this.model.get('courses').indexOf(window.currentCourse.get('id')) !== -1;
        if(this.linked) {
            this.$('.btn-link').hide();
            this.$('.btn-unlink').show();
        } else {
            this.$('.btn-link').show();
            this.$('.btn-unlink').hide();
        }
    },

    /**
     * EVENTS
     */

    toggleLink : function(e) {
        var courseId = window.currentCourse.get('id');
        if(this.linked){
            this.model.unlink(courseId);
        }else{
            this.model.link(courseId);
        }
    }
});