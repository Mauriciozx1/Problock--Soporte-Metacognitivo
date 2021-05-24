CSLP.Admin.Views.TeacherRow = Backbone.View.extend({

    className : 'teacher-row',

    tagName : 'tr',

    events : {
        'click .btn-delete' : 'delete'
    },

    initialize : function() {
        this.template = _.template($('#teacher-row-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);

        this.render();
        this.$el.appendTo('#teachers-tbody');

    },

    render : function() {
        var data = this.model.toJSON();

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    /**
     * EVENTS
     */

    delete : function(e) {
        var response = confirm('¿Seguro que quieres eliminar este usuario?');
        if(response)
            this.model.delete();
    }
});