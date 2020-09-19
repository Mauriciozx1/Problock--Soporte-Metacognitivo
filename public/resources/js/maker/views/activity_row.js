CSLP.Maker.Views.ActivityRow = Backbone.View.extend({
    tagName : 'li',
    className : '',

    events : {
        'click' : 'selectActivity'
    },

    initialize : function() {
        this.template = _.template($('#activity-row-template').html());

        //Enlazando eventos
        this.listenTo(this.model, 'change', this.render);
        this.listenTo(this.model, 'delete', this.remove);

        this.render();
    },

    render : function() {
        var data = this.model.toJSON();

        //Remueve todas las clases que pueda ya tener asignadas
        this.$el.attr('class', 'activity-row');

        if(this.model.get('selected'))
            this.$el.addClass('selected');

        //Se une el template creado en "initialize", con el data del modelo
        var HTML = this.template(data);

        //Se indica que el contenido de la vista, va a ser el HTML recien creado, de template + data
        this.$el.html(HTML);
    },

    /**
     * EVENTS
     */

    //Selecciona una actividad en el menu
    selectActivity : function() {
        $('.activity-row.active').removeClass('active');
        this.$el.addClass('active');
        window.activityPanel.setActivity(this.model);

    },

    remove : function(){
        this.$el.remove();
    }



});
