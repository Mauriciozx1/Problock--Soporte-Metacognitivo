CSLP.Workboard.Views.Student = Backbone.View.extend({

    className : 'student-row',

    tagName : 'ul',

    events : {
        
    },

    linked : false,

    initialize : function() {
        this.template = _.template($('#student-row-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);
        this.render();

    },

    render : function() {
        var data = this.model.toJSON();

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
        
    },

    //Establece si el boton debe estar en "Enlazar" o "Desenlazar"

    /**
     * EVENTS
     */
});