CSLP.Exercises.Views.Exercise = Backbone.View.extend({

    className : 'exercise',
    tagName : 'div',

    events : {
        'click .btn-edit' : 'edit'
    },


    initialize : function(){
        this.template = _.template($('#exercise-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'destroy', this.remove);

        this.$el.appendTo('#exercises-container');

        this.render();

    },

    show : function(){
        this.$el.show();
    },

    hide : function() {
        this.$el.hide();
    },

    render : function(){
        var data = this.model.toJSON();


        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    /**
     * EVENTS
     */

    edit : function(){
        window.modal.setModel(this.model);
        window.modal.toggle();
    }

});
