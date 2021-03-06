CSLP.Exercises.Views.Course= Backbone.View.extend({

    className : 'course-row',
    tagName : 'li',

    events : {
        'click' : 'setCourse'
    },

    initialize : function(){
        this.template = _.template($('#course-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'delete', this.remove);

        this.render();
        this.$el.appendTo('#courses-list');

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

    setCourse : function(){

        $('.course-row.active').removeClass('active');
        this.$el.addClass('active');

        window.setCurrentCourse(this.model);
    }
});
